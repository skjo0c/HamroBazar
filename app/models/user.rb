class User < ApplicationRecord
	validates_uniqueness_of :email
	validates :firstname, :lastname, :email, :mobile, presence: true
	validates_presence_of :password_confirmation
	has_many :advertisements, :dependent => :destroy
	mount_uploader :picture, ProfilePictureUploader
	has_secure_password
end
