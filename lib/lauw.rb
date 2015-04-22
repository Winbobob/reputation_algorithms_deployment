#Define Submission class and related method
class Submission
  attr_accessor :review_records
  attr_accessor :temp_score
end

#Define Review_record class, a mapping class (between Submission and Reviewer)
class Review_record
  attr_accessor :submission
  attr_accessor :reviewer
  attr_accessor :score

  def inspect
    "#<#{self.class.name} reviewer_name=\"#{reviewer.name}\" score=\"#{score}\" >"
  end
end

#Define Reviewer class and related methods
class Reviewer
  attr_accessor :name
  attr_accessor :review_records
  attr_accessor :reputation
  attr_accessor :leniency
  attr_accessor :weight

  def initialize(name, review_records,leniency)
    @name = name
    @review_records = review_records
    @leniency=leniency
    @weight=0
  end

  def inspect
    "#<#{self.class.name} name=\"#{name}\" reputation=\"#{reputation}\" leniency=\"#{leniency}\">"
  end

  def weight
    @weight
  end
end

#Add data to @reviewers
def reviewers
  return @reviewers if @reviewers

  @reviewers = []
  @all_reviewers_simple_array = [4434, 4842, 5049, 5156, 5382, 5423, 5503, 5504, 5505, 5506, 5507, 5508, 5509, 5510, 5511, 5512, 5513, 5514, 5515, 5516, 5517, 5518, 5519, 5520, 5521, 5522, 5523, 5524, 5525, 5526, 5527, 5528, 5529, 5530, 5531, 5532, 5533, 5534, 5535, 5536, 5537, 5538, 5539, 5540, 5541, 5542, 5543, 5544, 5545, 5546, 5547, 5548, 5549, 5550, 5551, 5552, 5553, 5554, 5555, 5556, 5557, 5558, 5559, 5560, 5561, 5562, 5563, 5564, 5565, 5566, 5567, 5568, 5569, 5570, 5571, 5572, 5573, 5574, 5575, 5576, 5577, 5578, 5579, 5580, 5581, 5582, 5583, 5584, 5585, 5586, 5587, 5588, 5589, 5590, 5591, 5592, 5593, 5594, 5595, 5596, 5597, 5598, 5599, 5600, 5601, 5602, 5603, 5649]
  @all_reviewers_simple_array.each do |name|
    @reviewers << Reviewer.new(name.to_s, [],0)
  end

  return @reviewers
end

#Add data to submissions
def submissions()
  return @submissions if @submissions
  @submissions = []
  #task 1
  scores = [[nil,nil,nil,87.5,95.0,nil,nil,nil,nil,nil,nil,65.0,nil,nil,nil,nil,nil,nil,nil,nil,87.5,100.0,nil,nil,nil,nil,95.0,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,87.5,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,100.0,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,85.0,nil,nil,nil,90.0,nil,nil,nil,100.0,nil,nil,nil,nil,nil,90.0,nil,nil,nil,92.5,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil],[nil,nil,nil,nil,nil,nil,nil,nil,nil,100.0,nil,62.5,100.0,92.5,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,95.0,nil,82.5,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,95.0,nil,nil,nil,nil,nil,nil,nil,nil,nil,95.0,nil,nil,nil,nil,nil,nil,nil,nil,87.5,nil,82.5,nil,nil,nil,nil,nil,80.0,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil],[nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,75.0,75.0,nil,nil,62.5,nil,nil,nil,nil,nil,90.0,97.5,nil,nil,nil,nil,92.5,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,80.0,nil,nil,nil,82.5,nil,nil,nil,nil,nil,nil,nil,nil,100.0,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,95.0,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,82.5,nil,nil,nil,nil],[nil,nil,nil,nil,87.5,nil,nil,nil,nil,nil,80.0,90.0,nil,nil,87.5,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,65.0,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,97.5,nil,nil,nil,nil,nil,nil,nil,95.0,nil,87.5,nil,92.5,nil,80.0,nil,nil,nil,nil,nil,97.5,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,95.0,nil,nil,nil,nil,nil,nil,nil],[nil,87.5,nil,nil,97.5,nil,95.0,nil,nil,nil,nil,nil,nil,nil,77.5,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,95.0,nil,nil,nil,nil,95.0,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,85.0,nil,nil,nil,nil,nil,nil,nil,nil,nil,97.5,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,90.0,nil,nil,nil,nil,nil,nil,97.5,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,95.0,90.0,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil],[nil,nil,nil,92.5,87.5,nil,nil,nil,nil,nil,72.5,nil,nil,nil,nil,87.5,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,100.0,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,85.0,nil,nil,nil,nil,nil,nil,100.0,nil,nil,nil,97.5,nil,nil,nil,80.0,nil,nil,nil,nil,nil,nil,nil,nil,77.5,nil,82.5,nil,nil,nil,nil,nil,90.0,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,90.0,nil,nil,nil,nil,nil,nil],[nil,nil,nil,nil,97.5,nil,nil,nil,nil,nil,nil,20.0,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,62.5,nil,nil,20.0,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,75.0,nil,nil,70.0,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,87.5,nil,nil,nil,nil,95.0,nil,nil,nil,nil,90.0,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,100.0,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,77.5,nil,nil],[nil,90.0,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,97.5,nil,nil,nil,nil,90.0,nil,nil,nil,nil,92.5,nil,nil,nil,nil,nil,72.5,nil,nil,nil,nil,nil,82.5,nil,nil,nil,nil,nil,nil,nil,90.0,nil,97.5,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,90.0,nil,nil,nil,nil,nil,87.5,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,97.5,90.0,nil,nil,nil,nil,nil,87.5,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil],[nil,nil,nil,nil,nil,nil,95.0,nil,87.5,nil,72.5,nil,100.0,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,95.0,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,75.0,nil,nil,nil,nil,nil,nil,nil,87.5,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,95.0,nil,nil,nil,nil,nil,95.0,nil,nil,nil,nil,nil,nil,nil,82.5,nil,nil,nil,nil,nil,90.0,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,97.5,nil,nil,nil,nil],[nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,95.0,nil,nil,nil,nil,95.0,nil,nil,nil,nil,97.5,nil,nil,nil,nil,nil,nil,95.0,nil,nil,nil,nil,nil,80.0,nil,nil,nil,nil,nil,nil,nil,nil,nil,77.5,87.5,nil,nil,100.0,nil,97.5,92.5,nil,nil,nil,nil,nil,nil,92.5,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,90.0,nil,nil,nil,nil,nil,nil,nil,nil,nil,82.5,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil],[nil,nil,nil,nil,97.5,nil,nil,nil,nil,nil,55.0,nil,nil,nil,nil,nil,100.0,nil,nil,nil,nil,100.0,nil,nil,nil,nil,nil,nil,nil,nil,nil,95.0,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,60.0,80.0,nil,nil,90.0,nil,nil,80.0,95.0,nil,nil,nil,nil,nil,90.0,nil,nil,nil,nil,nil,nil,nil,nil,97.5,nil,nil,nil,nil,nil,nil,72.5,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil],[nil,nil,nil,nil,nil,nil,65.0,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,97.5,nil,nil,nil,nil,nil,nil,100.0,nil,nil,nil,nil,97.5,67.5,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,62.5,nil,95.0,nil,nil,100.0,80.0,nil,nil,nil,nil,nil,97.5,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,87.5,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,87.5,nil,nil,nil,nil,nil,90.0,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil],[nil,nil,nil,nil,97.5,nil,nil,nil,nil,nil,72.5,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,90.0,nil,nil,nil,82.5,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,85.0,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,95.0,nil,nil,nil,100.0,90.0,92.5,nil,nil,nil,nil,nil,nil,nil,nil,nil,82.5,nil,nil,nil,70.0,nil,nil,nil,92.5,nil,nil,nil,nil,95.0,nil,nil,nil,nil,nil,nil,nil],[nil,nil,nil,nil,nil,nil,100.0,nil,nil,nil,nil,62.5,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,90.0,nil,80.0,nil,nil,nil,nil,nil,97.5,nil,nil,nil,nil,nil,nil,nil,90.0,nil,nil,95.0,75.0,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,97.5,95.0,nil,nil,87.5,nil,nil,nil,nil,nil,nil,nil,nil,90.0,nil,nil,nil,72.5,nil,nil,nil,nil,87.5,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil],[nil,nil,nil,nil,97.5,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,92.5,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,100.0,nil,nil,nil,87.5,nil,nil,nil,nil,nil,nil,nil,nil,95.0,95.0,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,95.0,nil,nil,nil,92.5,nil,85.0,nil,nil,nil,85.0,nil,nil,85.0,nil,nil,80.0,nil,nil,nil,nil,67.5,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil],[nil,nil,nil,nil,82.5,nil,nil,nil,nil,nil,nil,nil,nil,nil,80.0,87.5,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,90.0,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,77.5,nil,nil,92.5,95.0,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,92.5,87.5,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,100.0,nil,95.0,nil,nil,nil,nil,nil,nil,85.0,nil,nil,nil,nil,87.5,nil,nil,nil,nil,nil,nil,80.0,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil],[nil,nil,nil,nil,nil,nil,nil,nil,nil,95.0,nil,nil,nil,72.5,nil,nil,nil,nil,nil,nil,nil,nil,82.5,nil,nil,nil,92.5,nil,nil,nil,nil,nil,90.0,nil,nil,nil,nil,82.5,nil,nil,nil,75.0,nil,nil,nil,nil,nil,nil,nil,nil,95.0,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,82.5,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,72.5,nil,nil,nil,nil,nil,nil,72.5,nil,nil,nil,nil,nil,nil,nil,92.5,nil,nil,nil,nil,nil,nil],[nil,nil,nil,nil,97.5,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,20.0,nil,nil,82.5,nil,nil,nil,nil,nil,nil,92.5,nil,nil,nil,nil,nil,95.0,nil,nil,nil,nil,nil,nil,95.0,nil,nil,nil,nil,nil,nil,nil,nil,nil,92.5,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,85.0,97.5,nil,nil,nil,nil,nil,92.5,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil],[nil,nil,nil,nil,97.5,nil,95.0,nil,nil,nil,nil,nil,nil,nil,nil,97.5,nil,nil,nil,nil,nil,nil,nil,nil,nil,90.0,nil,nil,nil,nil,nil,nil,nil,97.5,nil,nil,nil,nil,nil,nil,nil,82.5,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,97.5,nil,nil,nil,nil,85.0,nil,90.0,nil,nil,nil,nil,nil,nil,87.5,nil,nil,nil,95.0,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,92.5,nil,nil,95.0,nil,nil,nil,nil,nil,nil,nil,nil],[nil,nil,nil,nil,95.0,nil,nil,nil,nil,nil,nil,nil,100.0,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,95.0,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,97.5,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,95.0,nil,nil,nil,95.0,nil,nil,92.5,nil,87.5,nil,nil,nil,nil,nil,nil,95.0,nil,nil,nil,nil,nil,nil,nil,nil,97.5,92.5,nil,nil,nil,nil,nil,nil],[nil,nil,nil,nil,80.0,nil,nil,nil,nil,nil,65.0,47.5,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,87.5,nil,nil,nil,nil,92.5,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,65.0,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,87.5,nil,nil,92.5,nil,nil,nil,nil,nil,nil,90.0,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,90.0,nil,nil,90.0,nil,nil,nil,nil,nil,nil,nil],[nil,nil,nil,nil,95.0,nil,nil,nil,nil,nil,nil,72.5,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,92.5,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,100.0,nil,62.5,97.5,nil,nil,95.0,nil,nil,nil,nil,nil,nil,77.5,nil,87.5,nil,nil,nil,nil,nil,72.5,nil,nil,nil,nil,nil,75.0,95.0,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,90.0,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil],[nil,nil,nil,nil,nil,nil,97.5,nil,nil,nil,nil,nil,nil,nil,nil,nil,95.0,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,85.0,nil,nil,nil,nil,nil,92.5,nil,nil,nil,85.0,nil,nil,nil,nil,nil,82.5,nil,nil,nil,nil,nil,82.5,nil,nil,nil,nil,nil,nil,nil,82.5,nil,nil,87.5,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,95.0,nil,77.5,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,87.5,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil],[nil,nil,nil,nil,90.0,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,100.0,nil,nil,nil,nil,nil,95.0,nil,nil,nil,97.5,nil,nil,nil,nil,90.0,nil,nil,nil,nil,nil,92.5,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,87.5,95.0,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,87.5,nil,nil,nil,nil,nil,80.0,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,85.0,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil],[nil,nil,nil,90.0,87.5,nil,nil,nil,nil,nil,nil,77.5,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,70.0,nil,nil,nil,nil,nil,nil,nil,nil,nil,95.0,nil,nil,92.5,nil,nil,nil,nil,nil,nil,95.0,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,97.5,nil,nil,nil,nil,87.5,90.0,nil,nil,nil,nil,nil,nil,nil,92.5,nil,nil,nil,nil,nil,nil,nil,nil,85.0,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil],[nil,nil,nil,nil,87.5,nil,82.5,nil,nil,nil,nil,nil,nil,nil,nil,90.0,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,100.0,nil,nil,nil,nil,nil,nil,nil,nil,100.0,nil,80.0,95.0,82.5,nil,nil,nil,nil,nil,nil,nil,nil,95.0,90.0,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,95.0,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,95.0,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil],[nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,62.5,nil,nil,nil,nil,90.0,nil,nil,nil,nil,nil,nil,nil,nil,nil,95.0,nil,nil,nil,nil,90.0,nil,nil,nil,nil,nil,nil,nil,nil,nil,90.0,nil,nil,nil,nil,nil,nil,nil,nil,nil,97.5,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,95.0,nil,nil,nil,nil,nil,nil,92.5,nil,nil,nil,92.5,nil,nil,nil,nil,90.0,nil,97.5,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,90.0,nil,nil,nil,nil,nil],[nil,nil,nil,nil,95.0,nil,97.5,nil,nil,nil,nil,70.0,100.0,87.5,nil,nil,nil,nil,nil,nil,90.0,95.0,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,97.5,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,87.5,nil,nil,nil,nil,nil,nil,nil,nil,nil,95.0,nil,nil,95.0,nil,nil,nil,nil,95.0,nil,nil,nil,nil,nil,82.5,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil],[nil,nil,nil,nil,nil,100.0,92.5,nil,nil,nil,nil,90.0,nil,nil,nil,nil,97.5,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,77.5,nil,nil,nil,nil,nil,nil,nil,67.5,nil,nil,nil,nil,87.5,nil,nil,nil,nil,nil,nil,92.5,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,100.0,85.0,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,95.0,nil,nil,65.0,nil,nil,nil,nil],[nil,nil,nil,nil,nil,nil,nil,nil,90.0,nil,75.0,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,95.0,nil,97.5,nil,nil,nil,87.5,nil,nil,nil,77.5,nil,nil,nil,95.0,nil,nil,nil,nil,100.0,nil,nil,nil,nil,nil,nil,nil,nil,nil,95.0,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,95.0,nil,nil,nil,nil,nil,nil,95.0,nil,nil,nil,95.0,90.0,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil],[nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,80.0,nil,100.0,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,72.5,nil,nil,nil,72.5,nil,nil,nil,nil,nil,nil,nil,nil,100.0,nil,nil,nil,nil,nil,nil,nil,92.5,nil,nil,nil,nil,nil,nil,nil,nil,95.0,nil,nil,nil,nil,nil,92.5,nil,92.5,nil,nil,nil,nil,nil,nil,nil,87.5,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,95.0,97.5,nil,nil,87.5,nil,nil,nil,nil,nil,nil,nil],[nil,nil,nil,nil,92.5,nil,97.5,nil,nil,97.5,nil,nil,100.0,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,90.0,nil,nil,nil,nil,nil,nil,nil,nil,nil,92.5,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,77.5,100.0,nil,nil,nil,nil,nil,92.5,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,95.0,nil,nil,nil,nil,nil,nil,nil,95.0,nil,nil,nil,nil,nil,nil,nil,nil,nil,80.0,97.5,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil],[nil,nil,87.5,nil,97.5,100.0,nil,nil,nil,nil,57.5,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,70.0,85.0,nil,80.0,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,100.0,nil,nil,77.5,nil,nil,nil,97.5,nil,87.5,nil,nil,nil,nil,nil,nil,70.0,nil,nil,85.0,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil],[nil,nil,85.0,nil,97.5,nil,nil,nil,nil,nil,nil,nil,nil,nil,65.0,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,92.5,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,87.5,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,100.0,nil,nil,nil,nil,nil,nil,97.5,nil,nil,nil,85.0,nil,nil,nil,87.5,nil,nil,nil,nil,nil,nil,nil,92.5,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,92.5,nil,85.0,nil,nil,nil,nil,nil]]
  #submission_scores means one row in scores
  scores.each do |submission_scores|
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
        @review_records << r
      end
    end
    s1.review_records =@review_records

    @submissions << s1
  end

  add_review_records_to_reviewers(scores)
  return @submissions
end

def self.add_review_records_to_reviewers(scores)
  #initialize review records list for each reviewer
  @reviewers.each do |reviewer|
    reviewer.review_records=[]
  end
  @submissions.each do |submission|
    submission.review_records.each do |rr|
      rr.reviewer.review_records << rr
    end
  end
end

#Define Lauw's algorithm
def self.calculate_weighted_scores_and_reputation(submissions, reviewers)
  # Initialize weights
  reviewers.each {|reviewer| reviewer.leniency = 0}
  reviewers.each {|reviewer| reviewer.reputation = nil}
  alpha = 0.5

  # Iterate until convergence
  iterations = 0
  begin
    previous_leniency = reviewers.map(&:leniency)
    puts "=========================previous_leniencies=========================="
    previous_leniency.each_with_index do |leniency, index|
      puts @all_reviewers_simple_array[index].to_s + ": " + leniency.to_s
    end

    # Pass 1: calculated weighted grades for each submission
    submissions.each do |submission|
      sum_weighted_grades=0.0
      submission.review_records.each do |rr|
        sum_weighted_grades=sum_weighted_grades+rr.score*(1-alpha*rr.reviewer.leniency)
      end
      submission.temp_score=sum_weighted_grades.to_f/submission.review_records.size
      puts "temp_score=" + submission.temp_score.to_s
    end

    #Pass 2: calculate leniencies for each reviewer
    reviewers.each do |reviewer|
      sum_leniency=0.0
      reviewer.review_records.each do |rr|
        sum_leniency=sum_leniency+(rr.score-rr.submission.temp_score)/rr.score
      end

      if reviewer.review_records.size==0
        reviewer.leniency=0
      else
        reviewer.leniency=sum_leniency/reviewer.review_records.size
      end
    end
    iterations += 1

    current_leniency = reviewers.map(&:leniency)
  end while converged?(previous_leniency,current_leniency)
  #for each reviewer, use absolute value of leniency as reputation. At the same time make 1 the highest reputation and 0 the lowest
  reviewers.each do |reviewer|
    reviewer.reputation=1-(reviewer.leniency).abs
  end

  #for each reviewer, if no peer-review has been done in current task,  reputation =N/A
  final_reputation = reviewers.map(&:reputation)
  puts "=========================final_weights=========================="
  @reviewers.each_with_index do |reviewer, index|
    if reviewer.review_records.size>0
      puts @all_reviewers_simple_array[index].to_s + ": " + final_reputation[index].to_s
    else
      puts @all_reviewers_simple_array[index].to_s + ": N/A"
    end
  end

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

calculate_weighted_scores_and_reputation(@submissions, @reviewers)