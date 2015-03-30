class Reputation < ActiveRecord::Base
	# Validations
	validates :user_alias_name, presence: true, length: { maximum: 30 }
	#1.Scores assigned by all reviewers for this assignment
	validates :score_by_reviewer, presence: true
	#2.Author feedback scores assigned by all authors for this assignment
	validates :score_by_author, presence: true
	#3.Grades assigned by teaching staff to other assignments
	validates :score_by_TA, presence: true
	#4.Calibration data, if any, for this reviewer
	validates :calibration_data, presence: true
	#5.Text metrics on text from this reviewer--can probably come from automated-metareviewing web service(s)
	validates :text_matrics, presence: true
	#6.Previous reputation values for all participants in the assignment
	validates :previous_reputation, presence: true
	#7.Possibly the same data (#1-4) for every other assignment in which the students in this assignment have participated
	#validates :other_data, presence: true
end
