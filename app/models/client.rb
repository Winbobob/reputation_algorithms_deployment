class Client < ActiveRecord::Base
	has_many :assignments
	has_many :teams
	has_many :users
	validates :client_name, presence: true, length: { maximum: 30 }
end