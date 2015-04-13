class TasksController < ApplicationController
	#before_action :find_task, only: [:show, :update, :destroy]
	rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

	def index
		@tasks = Task.all
		render json: @tasks, status: 200		# OK
	end

	def show
		@task = Task.find(params[:id])
		render json: @task, status: 200		# OK
	end

	def create
		@task = Task.new(task_params)
		@task.save
		if @task.save
			render json: @task, status: 201		# Created
		else
#			logger.error @task.errors.full_messages
			render json: { :errors => @task.errors.full_messages }, status: 422		# Unprocessable entity
		end
	end

	def update
		if @task.update_attributes(task_params)
			render nothing: true, status: 204		# No content
		else
			render json: { :errors => @task.errors.full_messages }, status: 422		# Unprocessable entity
		end
	end

	def destroy
		@task.destroy
		render nothing: true, status: 204		# No content
	end

	private
		def task_params
		  params.require(:task).permit(:assignment_id, :name)
		end

		def find_task
			@task = Task.find(params[:id])
		end

		def record_not_found
			render json: { :errors => ["Record not found for id #{params[:id]}"] }, status: 404		# Not found
		end
end
