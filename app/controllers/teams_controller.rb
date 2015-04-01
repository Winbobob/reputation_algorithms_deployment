class TeamsController < ApplicationController
	#before_action :find_team, only: [:show, :update, :destroy]
	rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

	def index
		@teams = Team.all
		render json: @teams, status: 200		# OK
	end

	def show
		@team = Team.find(params[:id])
		render json: @team, status: 200		# OK
	end

	def create
		@team = Team.new(team_params)
		@team.save
		if @team.save
			render json: @team, status: 201		# Created
		else
#			logger.error @team.errors.full_messages
			render json: { :errors => @team.errors.full_messages }, status: 422		# Unprocessable entity
		end
	end

	def update
		if @team.update_attributes(team_params)
			render nothing: true, status: 204		# No content
		else
			render json: { :errors => @team.errors.full_messages }, status: 422		# Unprocessable entity
		end
	end

	def destroy
		@team.destroy
		render nothing: true, status: 204		# No content
	end

	private
		def team_params
		  params.permit(:user_alias_name, :score_by_reviewer, :score_by_author, :score_by_TA, :calibration_data, :text_matrics, :previous_team, :other_data)
#		  params.require(:team).permit(:name, :street, :city, :state, :zipcode, :home_phone, :work_phone, :email)
		end

		def find_team
			@team = Team.find(params[:id])
		end

		def record_not_found
			render json: { :errors => ["Record not found for id #{params[:id]}"] }, status: 404		# Not found
		end
end
