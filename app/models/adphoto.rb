class Adphoto < ApplicationRecord
	belongs_to: advertisement
	mount_base64_uploader :adphoto, AdphotoUploader
end
