class Task < ActiveRecord::Base
	belongs_to :assignment
	validates :name, presence: true
end