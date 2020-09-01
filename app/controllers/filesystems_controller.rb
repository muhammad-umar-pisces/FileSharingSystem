class FilesystemsController < ApplicationController
	def index
		@file = Filesystem.all
	end

	def new
		@file = Filesystem.new
	end

	def create
		@file = Filesystem.create(file_params)
		if @file.save
			flash[:notice] = "File created!"
		else
			flash[:notice] = "File not created!"
		end
		redirect_to filesystems_path
	end

	def show
		@file = Filesystem.find(params[:id])
	end

	def edit
		@file = Filesystem.find(params[:id])
		
	end

	def update
		@file = Filesystem.update(file_params)
		redirect_to filesystems_path
	end

	def delete
		@file = Filesystem.find(params[:id])
	end

	def destroy
		@file = Filesystem.find(params[:id])
		@file.destroy
		if @file.destroy
			flash[:notice] = 'file deleted!'
		else
			flash[:notice] = 'file not deleted'
		end
		redirect_to filesystems_path
	end

	private
	def file_params
		params.require(:filesystem).permit(:user_id, :file_name, :status)
	end
end
