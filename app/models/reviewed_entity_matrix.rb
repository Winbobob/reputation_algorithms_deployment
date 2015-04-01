class Reviewed_entity_matrix < ActiveRecord::Base
	belongs_to :entity
	validates :entity_id, presence: true
	validates :score, presence: true
	validates :type, presence: true
	self.inheritance_column = nil
end