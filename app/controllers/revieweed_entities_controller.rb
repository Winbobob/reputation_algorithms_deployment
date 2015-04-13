class RevieweedEntitiesController < ApplicationController
	#before_action :find_revieweed_entity, only: [:show, :update, :destroy]
	rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

	def index
		@revieweed_entities = Revieweed_entity.all
		render json: @revieweed_entities, status: 200		# OK
	end

	def show
		@revieweed_entity = Revieweed_entity.find(params[:id])
		render json: @revieweed_entity, status: 200		# OK
	end

	def create
		@revieweed_entity = Revieweed_entity.new(revieweed_entity_params)
		@revieweed_entity.save
		if @revieweed_entity.save
			render json: @revieweed_entity, status: 201		# Created
		else
#			logger.error @revieweed_entity.errors.full_messages
			render json: { :errors => @revieweed_entity.errors.full_messages }, status: 422		# Unprocessable entity
		end
	end

	def update
		if @revieweed_entity.update_attributes(revieweed_entity_params)
			render nothing: true, status: 204		# No content
		else
			render json: { :errors => @revieweed_entity.errors.full_messages }, status: 422		# Unprocessable entity
		end
	end

	def destroy
		@revieweed_entity.destroy
		render nothing: true, status: 204		# No content
	end

	private
		def revieweed_entity_params
		  params.require(:revieweed_entity).permit(:client_id, :expert_grde)
		end

		def find_revieweed_entity
			@revieweed_entity = Revieweed_entity.find(params[:id])
		end

		def record_not_found
			render json: { :errors => ["Record not found for id #{params[:id]}"] }, status: 404		# Not found
		end
end
