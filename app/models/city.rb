class City < ApplicationRecord
    mount_uploaders :photo, ImageUploader
end
