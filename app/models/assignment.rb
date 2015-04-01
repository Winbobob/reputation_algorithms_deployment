class Assignment < ActiveRecord::Base
	belongs_to :client
	has_many :tasks
	validates :task_num, presence: true
end