class ArtistsController < ApplicationController
	def index
		@artist = Artist.all
		@new_artist = Artist.new
		@full_feature = true
	end

	def popup
		@artist = Artist.new
		render 'popup', layout: false
	end

	def create
		@artist = Artist.new(artist_params)

		respond_to do |format|
			if @artist.save
				format.html { redirect_to action: 'index', notice: "Artist Added" }
				format.js
			else
				flash[:error] = "That record already exists"
				redirect_to action: 'index'
			end
		end
	end

	def edit
		@artist = Artist.find(params[:id])
		@full_feature = true
	end

	def update
		@artist = Artist.find(params[:id])
		if @artist.update(artist_params)
			redirect_to action: 'index', notice: "Artist Updated"
		else
			redirect_to action: 'edit'
		end
	end

	def destroy
		@artist = Artist.find(params[:id])
		@artist.destroy

		redirect_to action: 'index'
  	end

	private

	def artist_params
		params.require(:artist).permit(:first_name, :last_name)
	end
end
