class User < ApplicationRecord
	# mount_uploader :image, ImageUploader
  include Clearance::User
end
