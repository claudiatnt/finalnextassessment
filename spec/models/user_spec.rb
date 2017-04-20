require 'rails_helper'

RSpec.describe User, type: :model do
  context "validations" do
  	it "should have email, first name, last name and avatar" do
  		byebug
      should have_db_column(:email).of_type(:string)
      should have_db_column(:first_name).of_type(:string)
      should have_db_column(:last_name).of_type(:string)
      should have_db_column(:avatar).of_type(:string)
    end

    describe "validates presence of attributes" do
      it { is_expected.to validate_presence_of(:last_name) }
      it { is_expected.to validate_presence_of(:first_name) }
      it { is_expected.to validate_presence_of(:email) }
    end
  end
end
