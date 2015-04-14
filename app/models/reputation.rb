class Reputation < ActiveRecord::Base
	validates :reviewer_id, presence: true
	validates :task_id, presence: true
	validates :score, presence: true
end