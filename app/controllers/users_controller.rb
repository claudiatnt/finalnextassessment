class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		user = User.new(user_params)
		if user.save 
			flash[:error] = "There is an error with creating your account!"
		else
			flash[:success] = "Congratulations! You have successfully created an account!"
		end
		redirect_to root_path
	end

	def show
		if !(logged_in?)
			redirect_to new_user_path
		end
	end


	private

	def user_params
		params.require(:user).permit(:last_name, :first_name, :email, :password, :username)
	end
end
