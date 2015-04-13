class ScoreMetricsController < ApplicationController
	#before_action :find_score_metric, only: [:show, :update, :destroy]
	rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

	def index
		@score_metrics = Score_metric.all
		render json: @score_metrics, status: 200		# OK
	end

	def show
		@score_metric = Score_metric.find(params[:id])
		render json: @score_metric, status: 200		# OK
	end

	def create
		@score_metric = Score_metric.new(score_metric_params)
		@score_metric.save
		if @score_metric.save
			render json: @score_metric, status: 201		# Created
		else
#			logger.error @score_metric.errors.full_messages
			render json: { :errors => @score_metric.errors.full_messages }, status: 422		# Unprocessable entity
		end
	end

	def update
		if @score_metric.update_attributes(score_metric_params)
			render nothing: true, status: 204		# No content
		else
			render json: { :errors => @score_metric.errors.full_messages }, status: 422		# Unprocessable entity
		end
	end

	def destroy
		@score_metric.destroy
		render nothing: true, status: 204		# No content
	end

	private
		def score_metric_params
		  params.require(:score_metric).permit(:reviewer_id, :entity_id, :task_id, :score, :comment, :type)
		end

		def find_score_metric
			@score_metric = Score_metric.find(params[:id])
		end

		def record_not_found
			render json: { :errors => ["Record not found for id #{params[:id]}"] }, status: 404		# Not found
		end
end
