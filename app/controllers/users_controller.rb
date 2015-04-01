class UsersController < ApplicationController
	#before_action :find_user, only: [:show, :update, :destroy]
	rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

	def index
		@users = User.all
		render json: @users, status: 200		# OK
	end

	def show
		@user = User.find(params[:id])
		render json: @user, status: 200		# OK
	end

	def create
		@user = User.new(user_params)
		@user.save
		if @user.save
			render json: @user, status: 201		# Created
		else
#			logger.error @user.errors.full_messages
			render json: { :errors => @user.errors.full_messages }, status: 422		# Unprocessable entity
		end
	end

	def update
		if @user.update_attributes(user_params)
			render nothing: true, status: 204		# No content
		else
			render json: { :errors => @user.errors.full_messages }, status: 422		# Unprocessable entity
		end
	end

	def destroy
		@user.destroy
		render nothing: true, status: 204		# No content
	end

	private
		def user_params
		  params.permit(:user_alias_name, :score_by_reviewer, :score_by_author, :score_by_TA, :calibration_data, :text_matrics, :previous_user, :other_data)
#		  params.require(:user).permit(:name, :street, :city, :state, :zipcode, :home_phone, :work_phone, :email)
		end

		def find_user
			@user = User.find(params[:id])
		end

		def record_not_found
			render json: { :errors => ["Record not found for id #{params[:id]}"] }, status: 404		# Not found
		end
end
