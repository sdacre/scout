class Review < ApplicationRecord
	belongs_to :place, dependent: :destroy
	belongs_to :user
end
