class Task < ActiveRecord::Base
	belongs_to :assignment
	validates :PR_max_score, presence: true
	validates :PR_min_score, presence: true
	validates :BR_max_score, presence: true
	validates :BR_min_score, presence: true
end