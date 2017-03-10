class Place < ApplicationRecord
  mount_uploaders :image, ImageUploader
end
