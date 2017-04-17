class SessionsController < ApplicationController
	def new
		@user = User.new
	end

	def create
		user = User.find_by(email: params[:email])

		if user == nil 
			flash[:error] = "Email does not exist"
		elsif user.authenticate(params[:password])
			session[:user_id] = user.id
			flash[:message] = "Congratulations, you successfully signed in"
		else
			flash[:error] = "Password is invalid"
		end
		redirect_to root_path
	end

end
