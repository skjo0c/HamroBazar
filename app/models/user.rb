class User < ApplicationRecord
	mount_base64_uploader :picture, ProfilePictureUploader
end
