class Advertisement < ApplicationRecord
	validates :name, :price, :description, presence: true
	has_many :adphotos
	belongs_to :user
	has_and_belongs_to_many :categories
end
