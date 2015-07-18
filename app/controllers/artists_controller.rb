class ArtistsController < ApplicationController
	def index
		@artist = Artist.all
		@new_artist = Artist.new
	end

	def create
		@artist = Artist.new(artist_params)

		if @artist.save
			flash[:success] = "Artist Added"
			redirect_to action: 'index'
		else
			flash[:error] = "That record already exists"
			redirect_to action: 'index'
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
