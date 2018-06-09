class GalleriesController < ApplicationController


	def index
		@ids = Gallery.all
	end

	def new
		@gallery = Gallery.new
	end

	def create
		gallery = Gallery.create!(gallery_params)
		redirect_to gallery
	end

	def show
		@gallery = Gallery.find(params[:id])
	end

	private

	def gallery_params
		params.require(:gallery).permit(:title, :image)
	end
end
