class Score < ActiveRecord::Base
	validates :reviewer_id, presence: true
	validates :reviewee_id, presence: true
	validates :peer_review_score, presence: true
	validates :peer_review_length, presence: true
	validates :type, presence: true
end