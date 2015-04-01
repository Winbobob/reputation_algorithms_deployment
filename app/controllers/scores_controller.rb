class ScoresController < ApplicationController
	#before_action :find_score, only: [:show, :update, :destroy]
	rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

	def index
		@scores = Score.all
		render json: @scores, status: 200		# OK
	end

	def show
		@score = Score.find(params[:id])
		render json: @score, status: 200		# OK
	end

	def create
		@score = Score.new(score_params)
		@score.save
		if @score.save
			render json: @score, status: 201		# Created
		else
#			logger.error @score.errors.full_messages
			render json: { :errors => @score.errors.full_messages }, status: 422		# Unprocessable entity
		end
	end

	def update
		if @score.update_attributes(score_params)
			render nothing: true, status: 204		# No content
		else
			render json: { :errors => @score.errors.full_messages }, status: 422		# Unprocessable entity
		end
	end

	def destroy
		@score.destroy
		render nothing: true, status: 204		# No content
	end

	private
		def score_params
		  params.permit(:user_alias_name, :score_by_reviewer, :score_by_author, :score_by_TA, :calibration_data, :text_matrics, :previous_score, :other_data)
#		  params.require(:score).permit(:name, :street, :city, :state, :zipcode, :home_phone, :work_phone, :email)
		end

		def find_score
			@score = Score.find(params[:id])
		end

		def record_not_found
			render json: { :errors => ["Record not found for id #{params[:id]}"] }, status: 404		# Not found
		end
end
