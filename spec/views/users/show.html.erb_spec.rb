require 'rails_helper'

RSpec.describe "users/show.html.erb", type: :view do


  context "logged in as person's profile" do
    it "display edit out button" do
      user = FactoryGirl.create(:user)
      session[:user_id] = user.id
      @user = User.find(user.id)
      render
      expect(rendered).to have_link("Edit", href: edit_user_path(user.id))
    end
  end

end


