class Team_mapping < ActiveRecord::Base
	validates :team_id, presence: true
	validates :user_id, presence: true
end