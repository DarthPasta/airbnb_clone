class User < ApplicationRecord
  include Clearance::User
  	has_secure_password

	has_many :reservations 
	
end
