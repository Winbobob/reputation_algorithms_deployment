class Reputation < ActiveRecord::Base
	validates :task_id, presence: true
	validates :reviewer_id, presence: true
	validates :score, presence: true
end