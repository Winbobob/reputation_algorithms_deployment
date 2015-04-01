class ScoreMatricesController < ApplicationController
	#before_action :find_score_matrix, only: [:show, :update, :destroy]
	rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

	def index
		@score_matrices = Score_matrix.all
		render json: @score_matrices, status: 200		# OK
	end

	def show
		@score_matrix = Score_matrix.find(params[:id])
		render json: @score_matrix, status: 200		# OK
	end

	def create
		@score_matrix = Score_matrix.new(score_matrix_params)
		@score_matrix.save
		if @score_matrix.save
			render json: @score_matrix, status: 201		# Created
		else
#			logger.error @score_matrix.errors.full_messages
			render json: { :errors => @score_matrix.errors.full_messages }, status: 422		# Unprocessable entity
		end
	end

	def update
		if @score_matrix.update_attributes(score_matrix_params)
			render nothing: true, status: 204		# No content
		else
			render json: { :errors => @score_matrix.errors.full_messages }, status: 422		# Unprocessable entity
		end
	end

	def destroy
		@score_matrix.destroy
		render nothing: true, status: 204		# No content
	end

	private
		def score_matrix_params
		  params.permit(:reviewer_id, :entity_id, :task_id, :score, :type)
#		  params.require(:score_matrix).permit(:name, :street, :city, :state, :zipcode, :home_phone, :work_phone, :email)
		end

		def find_score_matrix
			@score_matrix = Score_matrix.find(params[:id])
		end

		def record_not_found
			render json: { :errors => ["Record not found for id #{params[:id]}"] }, status: 404		# Not found
		end
end
