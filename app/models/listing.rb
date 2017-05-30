class Listing < ApplicationRecord
	has_many :reservations
	has_many :taggables
	belongs_to :user
end
