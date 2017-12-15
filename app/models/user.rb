class User < ApplicationRecord
	validates_uniqueness_of :email
	validates :firstname, :lastname, :email, :mobile, presence: true
	validates_presence_of :password_confirmation
	has_many :advertisements
	mount_base64_uploader :picture, ProfilePictureUploader
	has_secure_password
end
