class Advertisement < ApplicationRecord
	validates :name, :price, :description, presence: true
	has_many :adphotos, :dependent => :destroy
	attr_accessor :picture_data
	belongs_to :user
	has_and_belongs_to_many :categories
end
