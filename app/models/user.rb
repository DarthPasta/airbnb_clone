class User < ApplicationRecord
	has_many :reservations 
	has_many :listings, through: :reservations
end
