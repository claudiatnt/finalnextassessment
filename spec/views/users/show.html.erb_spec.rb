require 'rails_helper'

RSpec.describe "users/show.html.erb", type: :view do


  context "logged in as the person on the profile" do
    it "display edit button" do
      user = FactoryGirl.create(:user)
      session[:user_id] = user.id
      @user = User.find(user.id)
      render
      expect(rendered).to have_link("Edit", href: edit_user_path(user.id))
    end

    it "displays the user's name" do
    	user = FactoryGirl.create(:user)
    	session[:user_id] = user.id
    	@user = User.find(user.id)
    	render
    	expect(rendered).to have_content(@user.name)
    end
  end

  # context "not logged in" do
  # 	it "displays the new user" do
  # 		render 
  # 		expect(rendered.to have_link("Logout", href: session_path))
  # 	end
  # end

end


