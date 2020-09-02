class FilesystemsController < ApplicationController
	def index
		@file = Filesystem.all
	end

	def new
		@file = Filesystem.new
	end

	def create
		@file = Filesystem.new(file_params)
		if @file.save
			flash[:notice] = "File created!"
		else
			flash[:notice] = "File not created!"
		end
		redirect_to filesystems_path
	end

	def show
		@file = Filesystem.find_by(id: params[:id])
		@comment = Comment.new
		unless @file.present?
			redirect_to filesystems_path
			flash[:notice] = 'file not found!'
		end
	end

	def edit
		@file = Filesystem.find_by_id(params[:id])
		
	end

	def update
		@file = Filesystem.update(file_params)
		redirect_to filesystems_path
	end


	def destroy
		@file = Filesystem.find_by_id(params[:id])
		if @file.destroy
			flash[:notice] = 'file deleted!'
		else
			flash[:notice] = 'file not deleted'
		end
		redirect_to filesystems_path
	end

	private
	def file_params
		params.require(:filesystem).permit(:user_id, :file_name, :status, :image)
	end
end
