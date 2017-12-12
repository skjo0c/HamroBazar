class Adphoto < ApplicationRecord
	belongs_to: advertisement
	mount_base64_uploader :picture, AdphotoUploader
end
