class Advertisement < ApplicationRecord
	validates :name, :price, :description, presence: true
end
