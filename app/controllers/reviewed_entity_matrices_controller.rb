class ReviewedEntityMatricesController < ApplicationController
	#before_action :find_reviewed_entity_matrix, only: [:show, :update, :destroy]
	rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

	def index
		@reviewed_entity_matrices = Reviewed_entity_matrix.all
		render json: @reviewed_entity_matrices, status: 200		# OK
	end

	def show
		@reviewed_entity_matrix = Reviewed_entity_matrix.find(params[:id])
		render json: @reviewed_entity_matrix, status: 200		# OK
	end

	def create
		@reviewed_entity_matrix = Reviewed_entity_matrix.new(reviewed_entity_matrix_params)
		@reviewed_entity_matrix.save
		if @reviewed_entity_matrix.save
			render json: @reviewed_entity_matrix, status: 201		# Created
		else
#			logger.error @reviewed_entity_matrix.errors.full_messages
			render json: { :errors => @reviewed_entity_matrix.errors.full_messages }, status: 422		# Unprocessable entity
		end
	end

	def update
		if @reviewed_entity_matrix.update_attributes(reviewed_entity_matrix_params)
			render nothing: true, status: 204		# No content
		else
			render json: { :errors => @reviewed_entity_matrix.errors.full_messages }, status: 422		# Unprocessable entity
		end
	end

	def destroy
		@reviewed_entity_matrix.destroy
		render nothing: true, status: 204		# No content
	end

	private
		def reviewed_entity_matrix_params
		  params.permit(:entity_id, :score, :type)
#		  params.require(:reviewed_entity_matrix).permit(:name, :street, :city, :state, :zipcode, :home_phone, :work_phone, :email)
		end

		def find_reviewed_entity_matrix
			@reviewed_entity_matrix = Reviewed_entity_matrix.find(params[:id])
		end

		def record_not_found
			render json: { :errors => ["Record not found for id #{params[:id]}"] }, status: 404		# Not found
		end
end
