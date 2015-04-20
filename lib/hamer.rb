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
    "#<#{self.class.name} name=\"#{name}\" variance=\"#{variance}\" reputation=\"#{reputation}\">"
  end

  def weight
    if !review_records == []
      review_records.first.weight
    else
      0
    end
  end
end

#Add data to @reviewers
def reviewers
  return @reviewers if @reviewers

  @reviewers = []
  @all_reviewers_simple_array = [4842, 5049, 5156, 5382, 5423, 5503, 5505, 5506, 5507, 5508, 5509, 5510, 5511, 5512, 5513, 5517, 5518, 5519, 5521, 5522, 5523, 5524, 5525, 5528, 5529, 5530, 5531, 5532, 5534, 5535, 5536, 5537, 5538, 5540, 5541, 5542, 5544, 5546, 5547, 5548, 5549, 5550, 5551, 5552, 5553, 5554, 5555, 5556, 5557, 5558, 5559, 5560, 5561, 5562, 5563, 5564, 5566, 5568, 5569, 5570, 5572, 5573, 5574, 5575, 5576, 5578, 5579, 5580, 5581, 5583, 5584, 5586, 5588, 5589, 5590, 5591, 5592, 5593, 5594, 5596, 5597, 5598, 5599, 5600, 5601, 5602]
  @all_reviewers_simple_array.each do |letter| # A-D: 4 reviewers
    @reviewers << Reviewer.new(letter.to_s, [], 1)
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
  scores = [[nil,nil,88,95,nil,nil,nil,nil,nil,65,nil,nil,nil,nil,nil,88,100,nil,nil,nil,95,nil,nil,nil,nil,nil,nil,nil,88,nil,nil,nil,nil,nil,nil,nil,nil,nil,100,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,85,nil,nil,nil,90,nil,100,nil,nil,nil,nil,90,nil,nil,93,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil],[nil,nil,nil,nil,nil,nil,nil,100,nil,63,100,93,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,95,83,nil,nil,nil,nil,nil,nil,nil,nil,nil,95,nil,nil,nil,nil,nil,nil,nil,nil,nil,95,nil,nil,nil,nil,nil,nil,nil,88,83,nil,nil,nil,nil,80,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil],[nil,nil,nil,nil,nil,nil,nil,nil,75,75,nil,nil,63,nil,nil,90,98,nil,nil,nil,93,nil,nil,nil,nil,nil,nil,nil,80,nil,nil,nil,83,nil,nil,nil,nil,nil,100,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,95,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,83,nil,nil],[nil,nil,nil,88,nil,nil,nil,nil,80,90,nil,nil,88,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,65,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,98,nil,nil,nil,nil,nil,nil,nil,95,nil,88,nil,93,nil,80,nil,nil,nil,98,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,95,nil,nil,nil,nil,nil],[88,nil,nil,98,nil,95,nil,nil,nil,nil,nil,nil,78,nil,nil,nil,nil,nil,nil,nil,95,nil,nil,95,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,85,nil,nil,nil,nil,nil,nil,nil,98,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,90,nil,nil,nil,nil,98,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,95,90,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil],[nil,nil,93,88,nil,nil,nil,nil,73,nil,nil,nil,nil,88,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,100,nil,nil,nil,nil,nil,nil,nil,nil,85,nil,nil,nil,nil,100,nil,nil,nil,98,nil,nil,nil,80,nil,nil,nil,nil,nil,nil,nil,nil,78,83,nil,nil,nil,90,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,90,nil,nil,nil,nil],[nil,nil,nil,98,nil,nil,nil,nil,nil,20,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,63,nil,20,nil,nil,nil,nil,nil,nil,nil,nil,nil,75,nil,nil,70,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,88,nil,nil,nil,95,nil,nil,nil,90,nil,nil,nil,nil,nil,nil,nil,100,nil,nil,nil,nil,nil,nil,nil,nil,nil,78],[90,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,98,nil,nil,nil,90,nil,nil,93,nil,nil,nil,nil,73,nil,nil,nil,nil,83,nil,nil,nil,nil,nil,90,nil,98,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,90,nil,nil,nil,88,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,98,90,nil,nil,nil,88,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil],[nil,nil,nil,nil,nil,95,88,nil,73,nil,100,nil,nil,nil,nil,nil,nil,nil,nil,nil,95,nil,nil,nil,nil,nil,nil,nil,75,nil,nil,nil,nil,nil,nil,88,nil,nil,nil,nil,nil,nil,nil,nil,nil,95,nil,nil,nil,nil,nil,95,nil,nil,nil,nil,nil,83,nil,nil,nil,nil,90,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,98,nil,nil],[nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,95,nil,95,nil,nil,nil,98,nil,nil,nil,nil,95,nil,nil,nil,nil,80,nil,nil,nil,nil,nil,nil,78,88,nil,nil,100,nil,98,93,nil,nil,nil,nil,nil,nil,93,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,90,nil,nil,nil,nil,nil,nil,83,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil],[nil,nil,nil,98,nil,nil,nil,nil,55,nil,nil,nil,nil,nil,100,nil,100,nil,nil,nil,nil,nil,nil,95,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,60,80,nil,nil,90,nil,nil,80,95,nil,nil,nil,nil,nil,90,nil,nil,nil,nil,nil,98,nil,nil,nil,nil,nil,73,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil],[nil,nil,nil,nil,nil,65,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,98,nil,nil,nil,nil,nil,100,nil,nil,98,68,nil,nil,nil,nil,nil,nil,nil,nil,63,95,nil,100,80,nil,nil,nil,nil,nil,98,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,88,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,88,nil,nil,nil,90,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil],[nil,nil,nil,98,nil,nil,nil,nil,73,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,90,nil,nil,nil,83,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,85,nil,nil,nil,nil,nil,nil,nil,nil,nil,95,nil,nil,100,90,93,nil,nil,nil,nil,nil,nil,nil,83,nil,70,nil,nil,nil,93,nil,nil,nil,95,nil,nil,nil,nil,nil],[nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil],[nil,nil,nil,nil,nil,100,nil,nil,nil,63,nil,nil,nil,nil,nil,nil,nil,nil,nil,90,nil,80,nil,nil,nil,98,nil,nil,nil,nil,nil,nil,90,nil,95,75,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,98,95,nil,nil,88,nil,nil,nil,nil,nil,nil,90,nil,nil,73,nil,nil,nil,88,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil],[nil,nil,nil,98,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,93,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,100,nil,nil,nil,88,nil,nil,nil,nil,nil,95,95,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,95,nil,nil,93,85,nil,nil,85,nil,nil,85,nil,80,nil,nil,nil,68,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil],[nil,nil,nil,83,nil,nil,nil,nil,nil,nil,nil,nil,80,88,nil,nil,nil,nil,nil,nil,90,nil,nil,nil,nil,nil,nil,nil,78,nil,nil,93,95,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,93,88,nil,nil,nil,nil,nil,nil,nil,nil,nil,100,95,nil,nil,nil,nil,nil,85,nil,nil,nil,88,nil,nil,nil,nil,80,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil],[nil,nil,nil,nil,nil,nil,nil,95,nil,nil,nil,73,nil,nil,nil,nil,nil,83,nil,nil,93,nil,nil,nil,90,nil,nil,nil,83,nil,nil,nil,75,nil,nil,nil,nil,nil,95,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,83,nil,nil,nil,nil,nil,nil,nil,nil,73,nil,nil,nil,nil,73,nil,nil,nil,nil,nil,nil,93,nil,nil,nil,nil],[nil,nil,nil,98,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,20,nil,83,nil,nil,nil,nil,nil,93,nil,nil,nil,95,nil,nil,nil,nil,nil,nil,95,nil,nil,nil,nil,nil,nil,nil,nil,nil,93,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,85,98,nil,nil,nil,93,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil],[nil,nil,nil,98,nil,95,nil,nil,nil,nil,nil,nil,nil,98,nil,nil,nil,nil,nil,90,nil,nil,nil,nil,nil,98,nil,nil,nil,nil,nil,nil,83,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,98,nil,nil,nil,nil,85,nil,90,nil,nil,nil,nil,88,nil,nil,95,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,93,nil,95,nil,nil,nil,nil,nil,nil],[nil,nil,nil,95,nil,nil,nil,nil,nil,nil,100,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,95,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,98,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,95,nil,nil,nil,95,nil,93,nil,88,nil,nil,nil,95,nil,nil,nil,nil,nil,nil,nil,98,93,nil,nil,nil,nil],[nil,nil,nil,80,nil,nil,nil,nil,65,48,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,88,nil,nil,93,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,65,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,88,nil,93,nil,nil,nil,nil,nil,90,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,90,nil,90,nil,nil,nil,nil,nil],[nil,nil,nil,95,nil,nil,nil,nil,nil,73,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,93,nil,nil,nil,nil,nil,nil,nil,nil,nil,100,nil,63,98,nil,nil,95,nil,nil,nil,nil,nil,nil,78,nil,88,nil,nil,nil,73,nil,nil,nil,nil,75,95,nil,nil,nil,nil,nil,nil,nil,nil,nil,90,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil],[nil,nil,nil,nil,nil,98,nil,nil,nil,nil,nil,nil,nil,nil,95,nil,nil,nil,nil,nil,nil,nil,nil,85,nil,nil,nil,nil,93,nil,nil,nil,85,nil,nil,nil,83,nil,nil,nil,nil,83,nil,nil,nil,nil,nil,nil,nil,83,nil,nil,88,nil,nil,nil,nil,nil,nil,nil,95,nil,78,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,88,nil,nil,nil,nil,nil,nil,nil,nil],[nil,nil,nil,90,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,100,nil,nil,95,nil,nil,98,nil,nil,90,nil,nil,nil,nil,93,nil,nil,nil,nil,nil,nil,nil,nil,nil,88,95,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,88,nil,nil,nil,nil,80,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,85,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil],[nil,nil,90,88,nil,nil,nil,nil,nil,78,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,70,nil,nil,nil,nil,nil,nil,nil,95,nil,93,nil,nil,nil,nil,nil,nil,95,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,98,nil,nil,nil,88,90,nil,nil,nil,nil,nil,93,nil,nil,nil,nil,nil,nil,85,nil,nil,nil,nil,nil,nil,nil,nil,nil],[nil,nil,nil,88,nil,83,nil,nil,nil,nil,nil,nil,nil,90,nil,nil,nil,nil,nil,nil,nil,nil,100,nil,nil,nil,nil,nil,100,nil,80,95,83,nil,nil,nil,nil,nil,95,90,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,95,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,95,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil],[nil,nil,nil,nil,nil,nil,nil,nil,nil,63,nil,nil,nil,nil,90,nil,nil,nil,nil,nil,95,nil,nil,90,nil,nil,nil,nil,nil,nil,nil,nil,90,nil,nil,nil,nil,nil,nil,98,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,95,nil,nil,nil,nil,93,nil,nil,93,nil,nil,nil,90,nil,98,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,90,nil,nil,nil],[nil,nil,nil,95,nil,98,nil,nil,nil,70,100,88,nil,nil,nil,90,95,nil,nil,nil,nil,nil,nil,nil,nil,98,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,88,nil,nil,nil,nil,nil,nil,nil,nil,95,nil,nil,95,nil,nil,nil,nil,95,nil,nil,nil,83,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil],[nil,nil,nil,nil,100,93,nil,nil,nil,90,nil,nil,nil,nil,98,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,78,nil,nil,nil,nil,nil,nil,68,nil,nil,88,nil,nil,nil,nil,nil,nil,93,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,100,85,nil,nil,nil,nil,nil,nil,nil,nil,nil,95,nil,nil,65,nil,nil],[nil,nil,nil,nil,nil,nil,90,nil,75,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,95,nil,98,nil,nil,88,nil,nil,nil,78,nil,nil,95,nil,nil,100,nil,nil,nil,nil,nil,nil,nil,nil,nil,95,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,95,nil,nil,nil,nil,nil,95,nil,nil,95,90,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil],[nil,nil,nil,nil,nil,nil,nil,nil,80,nil,100,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,73,nil,nil,nil,73,nil,nil,nil,nil,nil,100,nil,nil,nil,nil,nil,nil,nil,93,nil,nil,nil,nil,nil,nil,nil,nil,95,nil,nil,nil,93,93,nil,nil,nil,nil,nil,nil,88,nil,nil,nil,nil,nil,nil,nil,nil,nil,95,98,nil,88,nil,nil,nil,nil,nil],[nil,nil,nil,93,nil,98,nil,98,nil,nil,100,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,90,nil,nil,nil,nil,nil,nil,93,nil,nil,nil,nil,nil,nil,nil,nil,78,100,nil,nil,nil,nil,nil,93,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,95,nil,nil,nil,nil,nil,nil,95,nil,nil,nil,nil,nil,nil,80,98,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil],[nil,88,nil,98,100,nil,nil,nil,58,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,70,85,80,nil,nil,nil,nil,nil,nil,nil,nil,nil,100,nil,nil,78,nil,nil,nil,98,nil,88,nil,nil,nil,nil,nil,nil,70,nil,85,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil],[nil,85,nil,98,nil,nil,nil,nil,nil,nil,nil,nil,65,nil,nil,nil,nil,nil,nil,nil,93,nil,nil,nil,nil,nil,nil,nil,88,nil,nil,nil,nil,nil,nil,nil,nil,nil,100,nil,nil,nil,nil,nil,nil,98,nil,nil,nil,85,nil,nil,nil,88,nil,nil,nil,nil,nil,93,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,93,nil,85,nil,nil,nil]]
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
  submissions.each {|s| s.review_records.each {|review| review.weight = 1}}
  reviewers.each {|reviewer| reviewer.reputation = 1}

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
      sum_weight = review_records.map(&:weight).inject{|sum,x| sum+x}.to_f
      predicted_score = weighted_scores.inject{|sum,x| sum+x}.to_f/sum_weight

      # Add to the reviewers' variance average
      review_records.each do |review|
        reviewer = review.reviewer
        review_variance = (review.score - predicted_score) ** 2
        if review_variance==0
          review_variance=0.01
        end
        if reviewer.review_records.count!=0
          reviewer.variance += review_variance / reviewer.review_records.count
        end
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

    current_weights = reviewers.map(&:reputation)

  end while converged?(previous_weights,current_weights)

  return :iterations => iterations
end

# Ensure all numbers in lists a and b are equal
# Options: :precision => Number of digits to round to
def self.converged?(a, b, options={:precision => 1})
  raise "a and b must be the same size" unless a.size == b.size
  a.flatten!
  b.flatten!

  p = options[:precision]
  a.map! {|num| num.to_f.round(p)}
  b.map! {|num| num.to_f.round(p)}

  #judge initial situation
  if (a.uniq.length == 1) && (b.uniq.length == 1)
    return true
  else
    result = !(a == b)
    return result
  end
end

#==========================================================================================
#initialize
reviewers
submissions

#check if review records are associated to reviewers
#@reviewers.each do |reviewer|
#  reviewer.review_records.each do |rr|
#    puts rr.inspect
#  end
#end

#puts '================================================='
#check if review records are associated to submissions
#@submissions.each do |submission|
#  submission.review_records.each do |rr|
#    puts rr.inspect
#  end
#end
calculate_weighted_scores_and_reputation(@submissions, @reviewers)