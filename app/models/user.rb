class User < ApplicationRecord

    require 'strava/api/v3'

  mount_uploader :profile, ProfileUploader
  include Clearance::User
  has_many :authentications, :dependent => :destroy
  has_many :reviews

    mount_uploader :profile, ProfileUploader
    include Clearance::User
    has_many :authentications, dependent: :destroy

    def self.create_with_auth_and_hash(authentication, auth_hash)
        user = User.create!(username: auth_hash['info']['name'], email: auth_hash['extra']['raw_info']['email'])
        user.authentications << authentication
        user
    end

    def fb_token
        x = authentications.where(provider: :facebook).first
        return x.token unless x.nil?
    end

    def password_optional?
        true
    end
end
