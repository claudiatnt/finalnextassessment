# require 'rails_helper'

# RSpec.describe "the signin process", type: :request do
# 	before :each do
#     User.make(last_name: 'chang', first_name: 'sheng', email: 'user@example.com', password: 'password')
#   end

#   it "signs me up" do
#     visit '/users/new'
#     within("#user") do
#       fill_in 'Email', with: 'user@example.com'
#       fill_in 'Password', with: 'password'
#       fill_in 'Last Name', with: 'chang'
#       fill_in 'First Name', with: 'sheng'
#     end
#     click_button 'Sign up'
#     expect(page).to have_content 'Congratulations'
#   end
# end