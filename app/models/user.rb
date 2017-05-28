class User < ApplicationRecord
  include Clearance::User
  	has_secure_password

	has_many :reservations 
	has_many :listings, through: :reservations

	
end
