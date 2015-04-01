class Client < ActiveRecord::Base
	has_many :assignments
	has_many :entities
	has_many :reviewers
	validates :client_name, presence: true, length: { maximum: 30 }
end