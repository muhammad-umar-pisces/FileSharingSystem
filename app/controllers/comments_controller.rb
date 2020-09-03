class CommentsController < ApplicationController
	before_action :authenticate_user!
	def create
		@file = Filesystem.find(params[:filesystem_id])
		@comment = @file.comments.new(comment_params)
		if @comment.save
			flash[:notice] = 'comment uploaded!'
			redirect_to @file
		else
			flash[:notice] = 'comment faild to load!'
			redirect_to @file
		end
	end

	def destroy
		@file = Filesystem.find_by_id(params[:filesystem_id])
		@comment = @filesystem.comments.find(params[:id])
		if @comment.destroy
			flash[:notice] = 'file deleted!'
		redirect_to @file
	else
		flash[:notice] = 'file not deleted!'
	end
	end

	private
	def comment_params
		params.require(:comment).permit(:filesystem_id, :content, :user_id)
	end
end
