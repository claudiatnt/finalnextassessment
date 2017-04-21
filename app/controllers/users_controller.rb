class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def index
    @filterrific = initialize_filterrific(User, params[:filterrific],
    	select_options: {
        sorted_by: User.options_for_sorted_by
      },
    ) or return




    @users = @filterrific.find

    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit
  	@user = User.find(current_user)
  end

  def update
  	if current_user.update(user_params)
  		flash[:message] = "Successfully updated your account!"
  		redirect_to "/"
  	else
  		flash[:error] = current_user.errors.messages
			redirect_to edit_user_path(current_user)
  	end
  end

	def create
		user = User.new(user_params)
		if user.save
			flash[:success] = "Congratulations! You have successfully created an account!"
		else
			flash[:error] = "There is an error with creating your account!"
		end
		redirect_to root_path
	end

	def show
		if !(logged_in?)
			redirect_to new_user_path
		elsif params[:id]
			@user = User.find(params[:id])
		else
			@user = current_user
		end
	end


	private

	def user_params
		params.require(:user).permit(:money, :last_name, :first_name, :email, :password, :avatar)
	end
end
