class CustomersController < ApplicationController
	before_action :find_customer, only: [:show, :update, :destroy]
	rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

	def index
		@customers = Customer.all
		render json: @customers, status: 200		# OK
	end

	def show
		@customer = Customer.find(params[:id])
		render json: @customer, status: 200		# OK
	end

	def create
		@customer = Customer.new(customer_params)
		@customer.save
		if @customer.save
			render json: @customer, status: 201		# Created
		else
#			logger.error @customer.errors.full_messages
			render json: { :errors => @customer.errors.full_messages }, status: 422		# Unprocessable entity
		end
	end

	def update
		if @customer.update_attributes(customer_params)
			render nothing: true, status: 204		# No content
		else
			render json: { :errors => @customer.errors.full_messages }, status: 422		# Unprocessable entity
		end
	end

	def destroy
		@customer.destroy
		render nothing: true, status: 204		# No content
	end

	private
		def customer_params
		  params.permit(:name, :street, :city, :state, :zipcode, :home_phone, :work_phone, :email)
#		  params.require(:customer).permit(:name, :street, :city, :state, :zipcode, :home_phone, :work_phone, :email)
		end

		def find_customer
			@customer = Customer.find(params[:id])
		end

		def record_not_found
			render json: { :errors => ["Record not found for id #{params[:id]}"] }, status: 404		# Not found
		end
end
