class User < ApplicationRecord
  include Clearance::User

	has_many :reservations 
  has_many :listings

  mount_uploader :avatar, AvatarUploader

     def password_optional?
      true
    end

	  def self.create_with_auth_and_hash(authentication, auth_hash)
      		user = User.create!(username: auth_hash["name"], email: auth_hash["extra"]["raw_info"]["email"])
      user.authentications << (authentication)   
      return user
  		end

  def fb_token
    x = self.authentications.where(:provider => :facebook).first
    return x.token unless x.nil?
  end
end
