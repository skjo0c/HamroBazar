class User < ApplicationRecord
	mount_base64_uploader :picture, ProfilePictureUploader
	has_secure_password
end
