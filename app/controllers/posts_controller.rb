class PostsController < ApplicationController
  #before_action :find_post, only: [:show, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    #@repu = calculate_reputation(0.8)
    @repu = generate_real_matrices
    render json: @repu, status: 200
  end

  def show
    
  end

  def create
#    puts post_params['client_id']
    #insert client data
    @client = Client.new({"name"=>post_params['client_name'], "crypted_key"=>['crypted_key']})
    @client.save

    #insert assignment data
    @assignment = Assignment.new({"client_id"=>post_params['client_id']})
    @assignment.save

    #insert revieweed entity data
    @entity = Revieweed_entity.new({"client_id"=>post_params['client_id'], "expert_grde"=>post_params['expert_grde']})
    @entity.save

    #insert reviewer data
    @reviewer = Reviewer.new({"client_id"=>post_params['client_id']})
    @reviewer.save

    #insert task data
    @task = Task.new({"assignment_id"=>post_params['assignment_id'], "name"=>post_params['task_name']})
    @task.save

    #insert reputation data
    @reputation = Reputation.new({"reviewer_id"=>post_params['reviewer_id'], "task_id"=>post_params['task_id'], "score"=>post_params['reputation_score']})
    @reputation.save

     #insert score metrics data
    @score_metric = Score_metric.new({"reviewer_id"=>post_params['reviewer_id'], "entity_id"=>post_params['entity_id'], "task_id"=>post_params['task_id'], "score"=>post_params['peer_review_score'], "comment"=>post_params['comment'], "type"=>post_params['type']})
    @score_metric.save

    #insert ground truth data
    @ground_truth = Ground_truth.new({"user_name"=>post_params['user_name'], "assignment_id"=>post_params['assignment_id'], "grade"=>post_params['grade']})
    @ground_truth.save

    render json: post_params, status: 201   # Created
#    redirect_to url_for(:controller => :clients, :action => :create, :client_name => post_params['client_name'])
  end

  def update

  end

  def destroy
  
  end

  def generate_real_matrices
    #get all entities
    @entities = Revieweed_entity.all
    #get all reviewers
    @all_reviewers = Reviewer.find_by_sql('select id from reviewers')
    #create big array to store all entities and reviewers data
    #@entities_and_reviewers = Array.new(@entities.count){Array.new(@reviewers.count)}
    @entities_and_reviewers = Array.new
    #all entities loop
    @entities.each do |entity|
      #change @all_reviewers array to simple one, each element is an integer
      @all_reviewers_simple_array = Array.new
      @all_reviewers.each do |reviewer|
        @all_reviewers_simple_array << reviewer.id.to_i
      end
      #get reviewers and scores for certain submission
      #@available_reviewers = Score_metric.find_by_sql('select reviewer_id, score from score_metrics where entity_id=' + entity.id.to_s)
      
      #find which position this reviewer is at
      #@reviewer_position = Reviewer 从reviewer表中找出相对位置，作为数组的index

      #each entity array to store related reviewers, create a new empty array
      #@each_entity = Array.new(@reviewers.count)
      @all_reviewers.each_with_index do |reviewer, index|
        @available_reviewer = Score_metric.find_by_sql('select score from score_metrics where entity_id=' + entity.id.to_s + ' and reviewer_id=' + reviewer.id.to_s)
        if @available_reviewer != [] 
          @all_reviewers_simple_array[index] = @available_reviewer[0].score
        else
          @all_reviewers_simple_array[index] = nil
        end
      end
      @entities_and_reviewers << @all_reviewers_simple_array
    end
    session[:entities_and_reviewers] = @entities_and_reviewers
    return @entities_and_reviewers
  end

  #temp reputation algorithm
  def calculate_reputation(s)
    s = s + Time.now.sec / 60.0
    s = (s - 1) * 0.8 if s > 1
    return s
  end

  private
    def post_params
      params.permit(:client_id, :client_name, :crypted_key, :assignment_id, :task_id, :task_name, :reviewer_id, :reputation_score, :entity_id, :expert_grde, :peer_review_score, :comment, :type, :user_name, :grade)
    end

    def find_post
      @post = Post.find(params[:id])
    end

    def record_not_found
      render json: { :errors => ["Record not found for id #{params[:id]}"] }, status: 404   # Not found
    end
end
