class Listing < ApplicationRecord
	has_many :reservations
	has_many :taggables
	belongs_to :user

	mount_uploader :image, ImageUploader
end
