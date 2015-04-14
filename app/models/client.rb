class Client < ActiveRecord::Base
	has_many :assignments
	has_many :entities
	has_many :reviewers
	validates :name, presence: true
	validates :crypted_key, presence: true
end