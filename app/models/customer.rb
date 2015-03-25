class Customer < ActiveRecord::Base
	# Validations
	validates :name, presence: true, length: { maximum: 30 }
	validates :street, presence: true, length: { maximum: 40 }
	validates :city, presence: true, length: { maximum: 30 }
	validates :state, presence: true, length: { maximum: 20 }
	validates :zipcode, presence: true, numericality: { only_integer: true }, length: { is: 5 }
	validates_format_of :home_phone, with: /\d{3}-\d{3}-\d{4}/
	validates_format_of :work_phone, with: /\d{3}-\d{3}-\d{4}/, allow_blank: true
	validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
end
