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

		respond_to do |format|
		if @user.save
			UsersMailer.sample_email(@user).deliver

			format.html {redirect_to @user, notice: 'User was successfully created.'}
			format.json {render :show, status: :created, location: @user}
			# flash = [success: "Successfully signed up "]
		else
			format.html {render :new}
			format.json {render json: @user.errors, status: :unprocessable_entity}
			# flash = [error: "Sign up failed"]
		end
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
