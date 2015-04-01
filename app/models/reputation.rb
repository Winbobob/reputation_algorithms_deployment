class Reputation < ActiveRecord::Base
	validates :task_id, presence: true
	validates :reputation_score, presence: true
	validates :user_reputation, presence: true
end