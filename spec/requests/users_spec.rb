require 'rails_helper'

RSpec.describe "the signin & signup process", type: :request do
	# before :each do
 #    User.make(last_name: 'chang', first_name: 'sheng', email: 'user@example.com', password: 'password')
 #  end
 	
 	let!(:user) { FactoryGirl.create(:user) }


  it "signs me up" do
    visit '/users/new'
    within("#user") do
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: 'password'
      fill_in 'Last name', with: 'chang'
      fill_in 'First name', with: 'sheng'
    end
    click_button 'Create User'
    expect(page).to have_content 'Congratulations'
  end

  it "signs me in" do
  	visit '/session/new'
  	within("#session") do
  		fill_in 'Email', with: 'cyusheng93@gmail.com'
  		fill_in 'Password', with: '123456'
  	end
  	click_button 'Sign In'
  	expect(page).to have_content 'Congratulations'
  end
end