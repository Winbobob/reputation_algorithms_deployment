class EntitiesController < ApplicationController
	#before_action :find_entity, only: [:show, :update, :destroy]
	rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

	def index
		@entities = Entity.all
		render json: @entities, status: 200		# OK
	end

	def show
		@entity = Entity.find(params[:id])
		render json: @entity, status: 200		# OK
	end

	def create
		@entity = Entity.new(entity_params)
		@entity.save
		if @entity.save
			render json: @entity, status: 201		# Created
		else
#			logger.error @entity.errors.full_messages
			render json: { :errors => @entity.errors.full_messages }, status: 422		# Unprocessable entity
		end
	end

	def update
		if @entity.update_attributes(entity_params)
			render nothing: true, status: 204		# No content
		else
			render json: { :errors => @entity.errors.full_messages }, status: 422		# Unprocessable entity
		end
	end

	def destroy
		@entity.destroy
		render nothing: true, status: 204		# No content
	end

	private
		def entity_params
		  params.permit(:client_id)
#		  params.require(:entity).permit(:name, :street, :city, :state, :zipcode, :home_phone, :work_phone, :email)
		end

		def find_entity
			@entity = Entity.find(params[:id])
		end

		def record_not_found
			render json: { :errors => ["Record not found for id #{params[:id]}"] }, status: 404		# Not found
		end
end
