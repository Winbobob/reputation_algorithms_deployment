class ReviewedEntitiesController < ApplicationController
	#before_action :find_reviewed_entity, only: [:show, :update, :destroy]
	rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

	def index
		@reviewed_entities = Reviewed_entity.all
		render json: @reviewed_entities, status: 200		# OK
	end

	def show
		@reviewed_entity = Reviewed_entity.find(params[:id])
		render json: @reviewed_entity, status: 200		# OK
	end

	def create
		@reviewed_entity = Reviewed_entity.new(reviewed_entity_params)
		@reviewed_entity.save
		if @reviewed_entity.save
			render json: @reviewed_entity, status: 201		# Created
		else
#			logger.error @reviewed_entity.errors.full_messages
			render json: { :errors => @reviewed_entity.errors.full_messages }, status: 422		# Unprocessable entity
		end
	end

	def update
		if @reviewed_entity.update_attributes(reviewed_entity_params)
			render nothing: true, status: 204		# No content
		else
			render json: { :errors => @reviewed_entity.errors.full_messages }, status: 422		# Unprocessable entity
		end
	end

	def destroy
		@reviewed_entity.destroy
		render nothing: true, status: 204		# No content
	end

	private
		def reviewed_entity_params
		  params.require(:reviewed_entity).permit(:client_id, :expert_grde)
		end

		def find_reviewed_entity
			@reviewed_entity = Reviewed_entity.find(params[:id])
		end

		def record_not_found
			render json: { :errors => ["Record not found for id #{params[:id]}"] }, status: 404		# Not found
		end
end
