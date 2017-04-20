class PostsController < ApplicationController
	def new
		@post = Post.new
	end

	def create
		post = current_user.posts.new(post_params)
		if post.save
			flash[:success] = "You have successfully created a post!"
			redirect_to root_path
		else
			flash[:error] = "There was an error creating your post!"
			redirect_to new_post_path
		end
	end

	def show
		@post = Post.find(params[:id])
		@comment = Comment.new
	end



	private

	def post_params
		params.require(:post).permit(:title, :story)
	end
end
