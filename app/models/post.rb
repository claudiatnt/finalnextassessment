class Post < ApplicationRecord
	belongs_to :user
	validates :title, presence: true
	mount_uploader :story, AvatarUploader
end
