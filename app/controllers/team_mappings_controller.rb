class Team_mappingsController < ApplicationController
	#before_action :find_team_mapping, only: [:show, :update, :destroy]
	rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

	def index
		@team_mappings = Team_mapping.all
		render json: @team_mappings, status: 200		# OK
	end

	def show
		@team_mapping = Team_mapping.find(params[:id])
		render json: @team_mapping, status: 200		# OK
	end

	def create
		@team_mapping = Team_mapping.new(team_mapping_params)
		@team_mapping.save
		if @team_mapping.save
			render json: @team_mapping, status: 201		# Created
		else
#			logger.error @team_mapping.errors.full_messages
			render json: { :errors => @team_mapping.errors.full_messages }, status: 422		# Unprocessable entity
		end
	end

	def update
		if @team_mapping.update_attributes(team_mapping_params)
			render nothing: true, status: 204		# No content
		else
			render json: { :errors => @team_mapping.errors.full_messages }, status: 422		# Unprocessable entity
		end
	end

	def destroy
		@team_mapping.destroy
		render nothing: true, status: 204		# No content
	end

	private
		def team_mapping_params
		  params.permit(:user_alias_name, :score_by_reviewer, :score_by_author, :score_by_TA, :calibration_data, :text_matrics, :previous_team_mapping, :other_data)
#		  params.require(:team_mapping).permit(:name, :street, :city, :state, :zipcode, :home_phone, :work_phone, :email)
		end

		def find_team_mapping
			@team_mapping = Team_mapping.find(params[:id])
		end

		def record_not_found
			render json: { :errors => ["Record not found for id #{params[:id]}"] }, status: 404		# Not found
		end
end
