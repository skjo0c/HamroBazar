class Adphoto < ApplicationRecord
  belongs_to :advertisement

  mount_uploader :picture, AdphotoUploader
end
