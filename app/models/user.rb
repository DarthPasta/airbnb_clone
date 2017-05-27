class User < ApplicationRecord
  include Clearance::User

	has_many :reservations 
	has_many :listings, through: :reservations

	has_secure_password
end
