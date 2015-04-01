class Entity < ActiveRecord::Base
	belongs_to :client
	has_many :reviewed_entity_matrices
end