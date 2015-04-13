class AssignmentsController < ApplicationController
	#before_action :find_assignment, only: [:show, :update, :destroy]
	rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

	def index
		@assignments = Assignment.all
		render json: @assignments, status: 200		# OK
	end

	def show
		@assignment = Assignment.find(params[:id])
		render json: @assignment, status: 200		# OK
	end

	def create
		@assignment = Assignment.new(assignment_params)
		@assignment.save
		if @assignment.save
			render json: @assignment, status: 201		# Created
		else
#			logger.error @assignment.errors.full_messages
			render json: { :errors => @assignment.errors.full_messages }, status: 422		# Unprocessable entity
		end
	end

	def update
		if @assignment.update_attributes(assignment_params)
			render nothing: true, status: 204		# No content
		else
			render json: { :errors => @assignment.errors.full_messages }, status: 422		# Unprocessable entity
		end
	end

	def destroy
		@assignment.destroy
		render nothing: true, status: 204		# No content
	end

	private
		def assignment_params
		  params.require(:assignment).permit(:client_id)
		end

		def find_assignment
			@assignment = Assignment.find(params[:id])
		end

		def record_not_found
			render json: { :errors => ["Record not found for id #{params[:id]}"] }, status: 404		# Not found
		end
end
