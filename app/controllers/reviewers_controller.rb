class ReviewersController < ApplicationController
	#before_action :find_reviewer, only: [:show, :update, :destroy]
	rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

	def index
		@reviewers = Reviewer.all
		render json: @reviewers, status: 200		# OK
	end

	def show
		@reviewer = Reviewer.find(params[:id])
		render json: @reviewer, status: 200		# OK
	end

	def create
		@reviewer = Reviewer.new(reviewer_params)
		@reviewer.save
		if @reviewer.save
			render json: @reviewer, status: 201		# Created
		else
#			logger.error @reviewer.errors.full_messages
			render json: { :errors => @reviewer.errors.full_messages }, status: 422		# Unprocessable entity
		end
	end

	def update
		if @reviewer.update_attributes(reviewer_params)
			render nothing: true, status: 204		# No content
		else
			render json: { :errors => @reviewer.errors.full_messages }, status: 422		# Unprocessable entity
		end
	end

	def destroy
		@reviewer.destroy
		render nothing: true, status: 204		# No content
	end

	private
		def reviewer_params
		  params.permit(:client_id)
#		  params.require(:reviewer).permit(:name, :street, :city, :state, :zipcode, :home_phone, :work_phone, :email)
		end

		def find_reviewer
			@reviewer = Reviewer.find(params[:id])
		end

		def record_not_found
			render json: { :errors => ["Record not found for id #{params[:id]}"] }, status: 404		# Not found
		end
end
