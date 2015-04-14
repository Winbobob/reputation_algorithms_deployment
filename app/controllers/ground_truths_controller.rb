class Ground_truthsController < ApplicationController
	#before_action :find_ground_truth, only: [:show, :update, :destroy]
	rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

	def index
		@ground_truths = Ground_truth.all
		render json: @ground_truths, status: 200		# OK
	end

	def show
		@ground_truth = Ground_truth.find(params[:id])
		render json: @ground_truth, status: 200		# OK
	end

	def create
		@ground_truth = Ground_truth.new(ground_truth_params)
		@ground_truth.save
		if @ground_truth.save
			render json: @ground_truth, status: 201		# Created
		else
#			logger.error @ground_truth.errors.full_messages
			render json: { :errors => @ground_truth.errors.full_messages }, status: 422		# Unprocessable ground_truth
		end
	end

	def update
		if @ground_truth.update_attributes(ground_truth_params)
			render nothing: true, status: 204		# No content
		else
			render json: { :errors => @ground_truth.errors.full_messages }, status: 422		# Unprocessable ground_truth
		end
	end

	def destroy
		@ground_truth.destroy
		render nothing: true, status: 204		# No content
	end

	private
		def ground_truth_params
		  params.require(:ground_truth).permit(:user_name, :assignment_id, :grade)
		end

		def find_ground_truth
			@ground_truth = Ground_truth.find(params[:id])
		end

		def record_not_found
			render json: { :errors => ["Record not found for id #{params[:id]}"] }, status: 404		# Not found
		end
end
