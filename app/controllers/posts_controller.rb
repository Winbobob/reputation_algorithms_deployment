class PostsController < ApplicationController
  #before_action :find_post, only: [:show, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    @posts = Post.all
    render json: @posts, status: 200    # OK
  end

  def show
    @post = Post.find(params[:id])
    render json: @post, status: 200   # OK
  end

  def create
#   post_params['client_id'] = @@data_hash['posts']['client_id']
#   puts post_params

    render json: post_params, status: 201   # Created
  end

  def update

  end

  def destroy
  
  end

  private
    def post_params
      params.permit(:client_id, :client_name, :assignment_id, :PR_max_score, :PR_min_score,:BR_max_score, :BR_min_score, :reviewer_id, :task_id, :score, :entity_id, :type)
#     params.require(:post).permit(:name, :street, :city, :state, :zipcode, :home_phone, :work_phone, :email)
    end

    def find_post
      @post = Post.find(params[:id])
    end

    def record_not_found
      render json: { :errors => ["Record not found for id #{params[:id]}"] }, status: 404   # Not found
    end
end
