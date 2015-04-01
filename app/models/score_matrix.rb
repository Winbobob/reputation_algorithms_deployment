class Score_matrix < ActiveRecord::Base
	validates :reviewer_id, presence: true
	validates :entity_id, presence: true
	validates :task_id, presence: true
	validates :score, presence: true
	validates :type, presence: true
	self.inheritance_column = nil
end