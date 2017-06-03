class UsersController < ApplicationController
	def index
	end

	def edit 
		@user = current_user
	end

	def update 
		@user = current_user
		if @user.update_attributes(user_params)
			redirect_to user_path 
		else
			redirect_to edit_user_path
		end
	end


	def new
		@user = User.new
	end

	def create 
		@user = User.create(user_params)
		if @user.save
			# flash = [success: "Successfully signed up "]
			redirect_to root_path
		else
			# flash = [error: "Sign up failed"]
			redirect_to users_new_path
		end
	end

	def show 
		@user = User.find(current_user.id)
	end

	private
		def user_params
			params.require(:user).permit(:username, :email, :password, :avatar)
		end

end
