class ArtworksController < ApplicationController

	def index
		@artwork = Artwork.all
	end

	def index2
		@artwork = Artwork.all
	end

	def show
		@artwork = Artwork.find(params[:id])
	end

	def new
		@artwork = Artwork.new
	end

	def edit
		@artwork = Artwork.find(params[:id])
	end

	def create
		@artwork = Artwork.new(artwork_params)

		if @artwork.save
			redirect_to @artwork
		else
			render 'new'
		end
	end

	def update
		@artwork = Artwork.find(params[:id])

		if @artwork.update(artwork_params)
			redirect_to @artwork
		else
			render 'edit'
		end
	end

	private

		def artwork_params
			params.require(:artwork).permit(:title, :jtg, :photo, :artist_id, :subject_ids => [], :location_ids => [], :keyword_ids => [], :style_ids => [], :medium_ids => [])
		end
end
