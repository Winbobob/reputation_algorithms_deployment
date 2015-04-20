#Define Submission class and related method
class Submission
  attr_accessor :review_records
end

#Define Review_record class, a mapping class (between Submission and Reviewer)
class Review_record
  attr_accessor :submission
  attr_accessor :reviewer
  attr_accessor :score
  attr_accessor :weight

  def inspect
    "#<#{self.class.name} reviewer_name=\"#{reviewer.name}\" score=\"#{score}\" weight=\"#{weight}\">"
  end
end

#Define Reviewer class and related methods
class Reviewer
  attr_accessor :name
  attr_accessor :review_records
  attr_accessor :variance
  attr_accessor :reputation

  def initialize(name, review_records, variance)
    @name = name
    @review_records = review_records
    @variance = variance
  end

  def inspect
    "#<#{self.class.name} name=\"#{name}\" variance=\"#{variance}\" >"
  end

  def weight
    review_records.first.weight
  end
end

#Add data to @reviewers
def reviewers
  return @reviewers if @reviewers

  @reviewers = []
  ('A'..'D').each do |letter| # A-D: 4 reviewers
    @reviewers << Reviewer.new(letter, nil, 0)
  end

  return @reviewers
end

#Add data to submissions
def submissions(rogue_score=5)
  return @submissions if @submissions
  #puts "enter new submissions"
  @submissions = []

  #scores = [[10,10,9,rogue_score],
  #          [3,2,4,rogue_score],
  #          [7,4,5,rogue_score],
  #          [6,4,5,rogue_score]]
  scores = session[:entities_and_reviewers]
  #submission_scores means one row in scores
  scores.each do |submission_scores|
    #puts submission_scores
   # puts "s1 = Submission.new"
    s1 = Submission.new
    i = -1
    @review_records=[]
    reviewers.map do |reviewer|
      if submission_scores[i+1].nil?
        i=i+1
      else
        r= Review_record.new
        r.submission = s1
        r.reviewer = reviewer
        r.reviewer.review_records ||= []
        r.reviewer.review_records << r
        r.score = submission_scores[i += 1]
        #puts r.inspect
        @review_records << r
      end
    end
    s1.review_records =@review_records

    @submissions << s1
    #puts "@submission.size "+@submissions.size.to_s

  end

  add_review_records_to_reviewers(scores)
  return @submissions
end


def self.add_review_records_to_reviewers(scores)
  @reviewers.each do |reviewer|
    scores.each do |row|
      reviewer.review_records << row[@reviewers.index(reviewer)]
    end
  end
end

#Define Hamer's algorithm
def self.calculate_weighted_scores_and_reputation(submissions, reviewers)
  # Initialize weights
  puts "=================calculate_weighted_scores_and_reputation====================="
  #puts 'submission.size:' + submissions.size.to_s
  #puts 'reviewers.size:' + reviewers.size.to_s
  #puts submissions[1].review_records[1].inspect
  submissions.each {|s| s.review_records.each {|review| review.weight = 1}}
  reviewers.each {|reviewer| reviewer.reputation = 1}
  #puts submissions[1].review_records[1].inspect

  # Iterate until convergence
  iterations = 0
  begin
    # Store previous weights to determine convergence
    previous_weights = reviewers.map(&:reputation)
    puts "=========================previous_weights=========================="
    puts previous_weights

    # Reset reviewer variance
    reviewers.each {|reviewer| reviewer.variance = 0 }

    # Pass 1: Calculate reviewer distance from average (variance)
    submissions.each do |submission|
      # Find current weighted average
      review_records = submission.review_records
      weighted_scores = review_records.map{|r|r.score * r.weight}
      total_weight = review_records.map(&:weight).inject{|sum,x| sum+x}.to_f
      weighted_average = weighted_scores.inject{|sum,x| sum+x}.to_f/total_weight

      # Add to the reviewers' variance average
      review_records.each do |review|
        reviewer = review.reviewer
        review_variance = (review.score - weighted_average) ** 2
        reviewer.variance += review_variance / reviewer.review_records.count
      end
    end

    # Pass 2: Use reviewer variance to calculate new review score weights
    average_variance = reviewers.map(&:variance).inject{|sum,x| sum+x} / reviewers.size
    submissions.each do |submission|
      submission.review_records.each do |review_record|
        weight = average_variance / review_record.reviewer.variance
        if weight > 2
          weight = 2 + Math.log10(weight - 1)
        end
        review_record.weight = weight
        review_record.reviewer.reputation=weight
      end
    end
    iterations += 1
  end while !converged?(previous_weights,
                        reviewers.map(&:weight))

  return :iterations => iterations
end

# Ensure all numbers in lists a and b are equal
# Options: :precision => Number of digits to round to
def self.converged?(a, b, options={:precision => 2})
  raise "a and b must be the same size" unless a.size == b.size
  a.flatten!
  b.flatten!

  p = options[:precision]
  a.each_with_index do |num, i|
    return false unless num.to_f.round(p) == b[i].to_f.round(p)
  end

  return true
end

def self.generate_real_matrices
  #get all entities
  @entities = Revieweed_entity.all
  #get all reviewers
  @reviewers = Reviewer.all
  #create big array to store all entities and reviewers data
  #@entities_and_reviewers = Array.new(@entities.count){Array.new(@reviewers.count)}
  @entities_and_reviewers = Array.new
  #all entities loop
  @entities.each do |entity|
    @available_reviewers = Score_metric.find_by_id('select reviewer_id as reviewer_id from score_metrics where entity_id=' + entity.id.to_s).first.try(:reviewer_id)
    #each entity array to store related reviewers, create a new empty array
    @each_entity = Array.new(@available_reviewers.count)
    @available_reviewers.each_with_index do |reviewer, index|
      @each_entity[index] = reviewer.to_i
    end
    @entities_and_reviewers << @each_entity
  end
end

#initialize
reviewers
submissions

#check if review records are associated to reviewers
@reviewers.each do |reviewer|
  reviewer.review_records.each do |rr|
    puts rr.inspect
  end
end

puts '================================================='
#check if review records are associated to submissions
@submissions.each do |submission|
  submission.review_records.each do |rr|
    puts rr.inspect
  end
end
calculate_weighted_scores_and_reputation(@submissions, @reviewers)
generate_real_matrices