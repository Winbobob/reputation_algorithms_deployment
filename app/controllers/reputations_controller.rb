class ReputationsController < ApplicationController
	#before_action :find_reputation, only: [:show, :update, :destroy]
	rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

	def index
		@reputations = Reputation.all
		render json: @reputations, status: 200		# OK
	end

	def show
		@reputation = Reputation.find(params[:id])
		render json: @reputation, status: 200		# OK
	end

	def create
		@reputation = Reputation.new(reputation_params)
		@reputation.save
		if @reputation.save
			render json: @reputation, status: 201		# Created
		else
#			logger.error @reputation.errors.full_messages
			render json: { :errors => @reputation.errors.full_messages }, status: 422		# Unprocessable entity
		end
	end

	def update
		if @reputation.update_attributes(reputation_params)
			render nothing: true, status: 204		# No content
		else
			render json: { :errors => @reputation.errors.full_messages }, status: 422		# Unprocessable entity
		end
	end

	def destroy
		@reputation.destroy
		render nothing: true, status: 204		# No content
	end

	private
		def reputation_params
		  params.require(:reputation).permit(:reviewer_id, :task_id, :score)
		end

		def find_reputation
			@reputation = Reputation.find(params[:id])
		end

		def record_not_found
			render json: { :errors => ["Record not found for id #{params[:id]}"] }, status: 404		# Not found
		end
end
