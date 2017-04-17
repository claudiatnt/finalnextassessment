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

	def create_from_omniauth
    auth_hash = request.env["omniauth.auth"]
    authentication = Authentication.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"]) || Authentication.create_with_omniauth(auth_hash)
    if authentication.user
      user = authentication.user
      authentication.update_token(auth_hash)
      @next = "/"
      @notice = "You're signed in again with fb"
    else
      user = User.create_with_auth_and_hash(authentication,auth_hash)
      # render "users/update"
      @next = edit_user_path(user)
      @notice = "Signed in first time with facebook"
    end
    sign_in(user)
    redirect_to @next, :notice => @notice
  end


end
