require 'rails_helper'

RSpec.describe User, type: :model do
  context "validations" do

  	it "should have all specific attributes" do
      should have_db_column(:last_name).of_type(:string)
      should have_db_column(:first_name).of_type(:string)
      should have_db_column(:email).of_type(:string)
      should have_db_column(:password_digest).of_type(:string)
    end

  	describe "validates presence of attributes" do
      it { is_expected.to validate_presence_of(:first_name) }
      it { is_expected.to validate_presence_of(:last_name) }
      it { is_expected.to validate_presence_of(:email) }
      it { is_expected.to validate_presence_of(:password) }
    end

    #happy
    describe "can be created when all attributes are present" do
	    When(:user) { User.create(
	      last_name: "Chang",
	      first_name: "Sheng",
	      email: "cyusheng93@gmail.com",
	      password: "123456",
	    )}
	    Then { user.valid? == true }
  	end

  	# unhappy_path
  	describe "cannot be created without a first name" do
      When(:user) { User.create(email: "cyusheng93@gmail.com", password: "123456", last_name: "Chang") }
      Then { user.valid? == false }
    end

    describe "cannot be created without a last name" do
      When(:user) { User.create(first_name: "Sheng", password: "123456", email: "cyusheng93@gmail.com") }
      Then { user.valid? == false }
    end

    describe "cannot be created without a email" do
      When(:user) { User.create(password: "123456", first_name: "Sheng", last_name: "Chang") }
      Then { user.valid? == false }
    end

    describe "cannot be created without a password" do
      When(:user) { User.create(email: "cyusheng93@gmail.com", first_name: "Sheng", last_name: "Chang") }
      Then { user.valid? == false }
    end

    describe "should permit valid email only" do
      let(:user1) { User.create(first_name: "Sheng", email: "tom@nextacademy.com", password: "123456", last_name: "Chang")}
      let(:user2) { User.create(last_name: "Andrews",email: "jack.com", password: "123456", first_name: "Jack") }

      # happy_path
      it "sign up with valid email" do
        expect(user1).to be_valid
      end

      # unhappy_path
      it "sign up with invalid email" do
        expect(user2).to be_invalid
      end
    end
  end

  context 'associations with dependency' do
    it { is_expected.to have_many(:authentications).dependent(:destroy)}
    it { is_expected.to have_many(:posts)}
    it { is_expected.to have_many(:comments)}
  end

end
