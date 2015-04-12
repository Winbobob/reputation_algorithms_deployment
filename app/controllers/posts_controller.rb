class PostsController < ApplicationController
  #before_action :find_post, only: [:show, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    @repu = calculate_reputation(0.8)
    render json: @repu, status: 200
  end

  def show
    
  end

  def create
#    puts post_params['client_id']
    #insert client data
    @client = Client.new({"client_name"=>post_params['client_name']})
    @client.save

    #insert assignment data
    @assignment = Assignment.new({"client_id"=>post_params['client_id']})
    @assignment.save

    #insert entity data
    @entity = Entity.new({"client_id"=>post_params['client_id']})
    @entity.save

    #insert reviewer data
    @reviewer = Reviewer.new({"client_id"=>post_params['client_id']})
    @reviewer.save

    #insert task data
    @task = Task.new({"assignment_id"=>post_params['assignment_id'], "PR_max_score"=>post_params['PR_max_score'], "PR_min_score"=>post_params['PR_min_score'], "BR_max_score"=>post_params['BR_max_score'], "BR_min_score"=>post_params['BR_min_score']})
    @task.save

    #insert reputation data
    @reputation = Reputation.new({"reviewer_id"=>post_params['reviewer_id'], "task_id"=>post_params['task_id'], "score"=>post_params['score']})
    @reputation.save

     #insert score metrics data
    @score_matrix = Score_matrix.new({"reviewer_id"=>post_params['reviewer_id'], "entity_id"=>post_params['entity_id'], "task_id"=>post_params['task_id'], "score"=>post_params['score'], "type"=>post_params['type']})
    @score_matrix.save

    #insert reviewed entity metrics data
    @reviewed_entity_matrix = Reviewed_entity_matrix.new({"entity_id"=>post_params['entity_id'], "score"=>post_params['score'], "type"=>post_params['type']})
    @reviewed_entity_matrix.save

    @score = post_params['score']

    render json: post_params, status: 201   # Created
#    redirect_to url_for(:controller => :clients, :action => :create, :client_name => post_params['client_name'])
  end

  def update

  end

  def destroy
  
  end

  #temp reputation algorithm
  def calculate_reputation(s)
    s = s + Time.now.sec / 60.0
    s = (s - 1) * 0.8 if s > 1
    return s
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
