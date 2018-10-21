class GalleriesController < ApplicationController
	before_action :set_gallery, only: [:show, :edit, :update, :destroy]
	def index
		@galleries = Gallery.all
	end

	def new
		@gallery = Gallery.new
	end

	def create
		gallery = Gallery.create!(gallery_params)
		redirect_to gallery
	end

	def edit
	end

	 def destroy
	  @gallery.destroy
	  redirect_to root_url
	  end

	def update
		if @gallery.update(gallery_params)
			redirect_to @gallery
		else
			render :edit
		end
	end

	def show
	end

	def delete_image
		image = ActiveStorage::Attachment.find(params[:id])
  		image.purge # or use purge_later
  		redirect_to gallery
	end

	private

	def set_gallery
		@gallery = Gallery.find(params[:id])
	end
	
	def gallery_params
		params.require(:gallery).permit(:title, :sampul, images:[] )
	end
end
