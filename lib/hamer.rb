#Define Submission class and related method
class Submission
  attr_accessor :review_records

  def weighted_score
    total_weight = 0.to_f
    points = review_records.map do |review|
      total_weight += review.weight
      review.weight * review.score
    end
    total_points = points.sum
    total_points / total_weight
  end
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
  attr_accessor :inaccuracy

  def initialize(name, review_records, inaccuracy)
    @name = name
    @review_records = review_records
    @inaccuracy = inaccuracy
  end

  def inspect
    "#<#{self.class.name} name=\"#{name}\" inaccuracy=\"#{inaccuracy}\" >"
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

  return @reviwers
end

#Add data to submissions
def submissions(rogue_score=5)
  return @submissions if @submissions
  puts "enter new submissions"
  @submissions = []

  scores = [[10,10,9,rogue_score],
            [3,2,4,rogue_score],
            [7,4,5,rogue_score],
            [6,4,5,rogue_score]]
  scores.each do |submission_scores|
    puts submission_scores
    puts "s1 = Submission.new"
    s1 = Submission.new
    i = -1
    @review_records=[]
    reviewers.map do |reviewer|
      r= Review_record.new
      r.submission = s1
      r.reviewer = reviewer
      r.reviewer.review_records ||= []
      r.reviewer.review_records << r
      r.score = submission_scores[i += 1]
      puts r.inspect
      @review_records << r
    end
    s1.review_records =@review_records

    @submissions << s1
    puts "@submission.size "+@submissions.size.to_s
  end

  return @submissions
end

#Define Hamer's algorithm
def self.calculate_weighted_scores_and_reputation(submissions, reviewers)
  # Initialize weights
  puts "=================calculate_weighted_scores_and_reputation====================="
  puts 'submission.size:' + submissions.size.to_s
  puts 'reviewers.size:' + reviewers.size.to_s
  puts 'submissions[1].review_records.size"'
  puts submissions[1].review_records[1].inspect
  submissions.each {|s| s.review_records.each {|review| review.weight = 1}}
  puts submissions[1].review_records[1].inspect

  # Iterate until convergence
  iterations = 0
  begin
    # Store previous weights to determine convergence
    previous_weights = submissions.map{|s|s.review_records.map(&:weight)}
    puts "=========================previous_weights=========================="
    puts previous_weights

    # Reset reviewer inaccuracy
    reviewers.each {|reviewer| reviewer.inaccuracy = 0 }

    # Pass 1: Calculate reviewer distance from average (inaccuracy)
    submissions.each do |submission|
      # Find current weighted average
      review_records = submission.review_records
      weighted_scores = review_records.map{|r|r.score * r.weight}
      total_weight = review_records.map(&:weight).inject{|sum,x| sum+x}.to_f
      weighted_average = weighted_scores.inject{|sum,x| sum+x}.to_f/total_weight

      # Add to the reviewers' inaccuracy average
      review_records.each do |review|
        reviewer = review.reviewer
        review_inaccuracy = (review.score - weighted_average) ** 2
        reviewer.inaccuracy += review_inaccuracy / reviewer.review_records.count
      end
    end

    # Pass 2: Use reviewer inaccuracy to calculate new review score weights
    average_inaccuracy = reviewers.map(&:inaccuracy).inject{|sum,x| sum+x} / reviewers.size
    submissions.each do |submission|
      submission.review_records.each do |review|
        weight = average_inaccuracy / review.reviewer.inaccuracy
        if weight > 2
          weight = 2 + Math.log10(weight - 1)
        end
        review.weight = weight
      end
    end
    iterations += 1
  end while !converged?(previous_weights,
                        submissions.map{|s|s.review_records.map(&:weight)})

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

reviewers
# reviewers.each do |reviewer|
#   puts reviewer.inspect
#   puts reviewer.review_records
#   puts reviewer.inaccuracy
# end
submissions
#submissions.new
#puts @submissions
#puts @submissions.nil?

#puts @reviewers
#puts @reviewers[1].name
calculate_weighted_scores_and_reputation(@submissions, @reviewers)
