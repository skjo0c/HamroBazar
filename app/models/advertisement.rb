class Advertisement < ApplicationRecord
	validates :name, :price, :description, presence: true
	has_many :adphotos
	attr_accessor :adphoto_data
end
