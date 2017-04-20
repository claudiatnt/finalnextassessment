require 'rails_helper'

RSpec.describe User, type: :model do
  context "validations" do
  	subject { described_class.new(password: "123456", first_name: "Sheng", last_name: "Chang", email: "cyusheng93@gmail.com") }

  	it "is valid with valid attributes" do
    	expect(subject).to be_valid
  	end

  	it "is not valid without first name" do
  		subject.first_name = nil
  		expect(subject).to_not be_valid
  	end

  	it "is not valid without email" do
  		subject.email = nil
  		expect(subject).to_not be_valid
  	end

  	it "is not valid without last_name" do
  		subject.last_name = nil
  		expect(subject).to_not be_valid
  	end

  	it "is not valid without password" do
  		subject.password = nil
  		expect(subject).to_not be_valid
  	end


  	describe "validates presence of attributes" do
      it { is_expected.to validate_presence_of(:first_name) }
      it { is_expected.to validate_presence_of(:last_name) }
    end
  end

end
