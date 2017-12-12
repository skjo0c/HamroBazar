class Advertisement < ApplicationRecord
	validates :name, :price, :description, presence: true
	has_many :adphotos
end
