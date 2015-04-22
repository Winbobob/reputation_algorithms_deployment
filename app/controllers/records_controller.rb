class RecordsController < ApplicationController
  #before_action :find_record, only: [:show, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    #@repu = calculate_reputation(0.8)
    @repu = generate_real_matrices
    render json: @repu, status: 200
    #render json: @all_reviewers_simple_array, status: 200

  end

  def show
    
  end

  def create
#    puts record_params['client_id']
    #insert client data
    @client = Client.new({"name"=>record_params['client_name'], "crypted_key"=>['crypted_key']})
    @client.save

    #insert assignment data
    @assignment = Assignment.new({"client_id"=>record_params['client_id'], "score_maximum"=>100.0, "score_minimum"=>0.0})
    @assignment.save

    #insert revieweed entity data
    @entity = Reviewed_entity.new({"client_id"=>record_params['client_id'], "expert_grade"=>record_params['expert_grde']})
    @entity.save

    #insert reviewer data
    @reviewer = Reviewer.new({"client_id"=>record_params['client_id']})
    @reviewer.save

    #insert task data
    @task = Task.new({"assignment_id"=>record_params['assignment_id'], "name"=>record_params['task_name']})
    @task.save

    #insert reputation data
    @reputation = Reputation.new({"reviewer_id"=>record_params['reviewer_id'], "task_id"=>record_params['task_id'], "score"=>record_params['reputation_score']})
    @reputation.save

     #insert score metrics data
    @score_metric = Score_metric.new({"reviewer_id"=>record_params['reviewer_id'], "entity_id"=>record_params['entity_id'], "task_id"=>record_params['task_id'], "score"=>record_params['peer_review_score'], "comment"=>record_params['comment'], "type"=>record_params['type']})
    @score_metric.save

     render json: record_params, status: 201   # Created
#    redirect_to url_for(:controller => :clients, :action => :create, :client_name => record_params['client_name'])
  end

  def update

  end

  def destroy
  
  end

  def generate_real_matrices
    #get all entities
    @entities = Reviewed_entity.find_by_sql("select * from reviewed_entities where id in (select entity_id from score_metrics where task_id=2);" ) 

    #get all reviewers
    @all_reviewers = Reviewer.find_by_sql('select id from reviewers')
    #create big array to store all entities and reviewers data
    #@entities_and_reviewers = Array.new(@entities.count){Array.new(@reviewers.count)}
    @entities_and_reviewers = Array.new
    #all entities loop
    @entities.each do |entity|
      #change @all_reviewers array to simple one, each element is an integer
      puts "================all_reviewers======================="
      @all_reviewers_simple_array = Array.new
      @all_reviewers.each do |reviewer|
        @all_reviewers_simple_array << reviewer.id.to_i
      end
      print @all_reviewers_simple_array
      #get expert_grades of all submissions
      puts "================all_expert_grades======================="
      @all_expert_grades = Array.new
      @entities.each_with_index do |entity|
        @all_expert_grades << entity.expert_grade.to_f
      end
      print @all_expert_grades
      #get reviewers and scores for certain submission
      #@available_reviewers = Score_metric.find_by_sql('select reviewer_id, score from score_metrics where entity_id=' + entity.id.to_s)
      
      #each entity array to store related reviewers, create a new empty array
      #@each_entity = Array.new(@reviewers.count)
      @all_reviewers.each_with_index do |reviewer, index|
        @available_reviewer = Score_metric.find_by_sql('select score from score_metrics where entity_id=' + entity.id.to_s + ' and reviewer_id=' + reviewer.id.to_s + ' and task_id = 2')
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
    def record_params
      params.permit(:client_id, :client_name, :crypted_key, :assignment_id, :task_id, :task_name, :reviewer_id, :reputation_score, :entity_id, :expert_grde, :peer_review_score, :comment, :type, :user_name, :grade)
    end

    def find_record
      @record = Record.find(params[:id])
    end

    def record_not_found
      render json: { :errors => ["Record not found for id #{params[:id]}"] }, status: 404   # Not found
    end
end
