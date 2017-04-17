class User < ApplicationRecord
	has_secure_password
	validates :last_name, presence: true
	validates :first_name, presence: true
	validates :username, presence: true, uniqueness: true
	validates :email, presence: true, uniqueness: true, format: { with: /.+@.+.com/, message: "Please input valid email" }
	validates :password, length: {minimum: 5}
end
