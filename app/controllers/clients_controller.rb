class ClientsController < ApplicationController
	#before_action :find_client, only: [:show, :update, :destroy]
	rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

	def index
		@clients = Client.all
		render json: @clients, status: 200		# OK
	end

	def show
		@client = Client.find(params[:id])
		render json: @client, status: 200		# OK
	end

	def create
		#client_params['client_name'] = 'zhewei'
		@client = Client.new(client_params)
		@client.save
		if @client.save
			render json: @client, status: 201		# Created
		else
#			logger.error @client.errors.full_messages
			render json: { :errors => @client.errors.full_messages }, status: 422		# Unprocessable entity
		end
	end

	def update
		if @client.update_attributes(client_params)
			render nothing: true, status: 204		# No content
		else
			render json: { :errors => @client.errors.full_messages }, status: 422		# Unprocessable entity
		end
	end

	def destroy
		@client.destroy
		render nothing: true, status: 204		# No content
	end

	private
		def client_params
		  params.require(:client).permit(:name, :crypted_key)
		end

		def find_client
			@client = Client.find(params[:id])
		end

		def record_not_found
			render json: { :errors => ["Record not found for id #{params[:id]}"] }, status: 404		# Not found
		end
end
