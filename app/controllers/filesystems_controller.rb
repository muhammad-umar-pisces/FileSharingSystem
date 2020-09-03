class FilesystemsController < ApplicationController
	before_action :find_filesystem, only: [:show, :update, :edit, :destroy]
	def index
		@files = Filesystem.order(created_at: :desc)
	end

	def new
		@file = Filesystem.new
	end

	def create
		@file = Filesystem.new(file_params)
		if @file.save
			flash[:notice] = "File created!"
			redirect_to filesystems_path
		else
			flash[:alert] = "File not created!"
			redirect_to new_filesystem_path
		end
	end

	def show
		@comment = Comment.new
		if @file.blank?
			redirect_to filesystems_path
			flash[:alert] = 'file not found!'		
		else
		@file.increase_visit
		end
	end

	def edit
	end

	def update
		if @file.update(file_params)
			flash[:notice] = 'file updated!'
		else
			flash[:alert] = 'file not updated!'
		end
		redirect_to filesystem_path
	end


	def destroy
		if @file.destroy
			flash[:notice] = 'file deleted!'
		else
			flash[:alert] = 'file not deleted'
		end
		redirect_to filesystems_path
	end

	private
	def file_params
		params.require(:filesystem).permit(:file_name, :status, :image, :user_id)
	end

	def find_filesystem
		@file = Filesystem.find_by_id(params[:id])
	end
end
