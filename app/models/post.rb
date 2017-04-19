class Post < ApplicationRecord
	belongs_to :user
	has_many :comments
	validates :title, presence: true
	mount_uploader :story, AvatarUploader
end
