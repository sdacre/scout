class User < ApplicationRecord
	mount_uploader :profile, ProfileUploader
  include Clearance::User
end
