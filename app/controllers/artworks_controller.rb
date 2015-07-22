class ArtworksController < ApplicationController
	before_filter :authenticate, :except => [:index2, :q, :ajax_show]
	def index
		@artwork = Artwork.all
	end

	def index2
		@artwork_q ||= Artwork.all
		@last_artwork = Artwork.new
		@last_artwork = @artwork_q.last

		# render plain: @artwork_q
	end

	def index3
		@artwork_q ||= Artwork.all
		@last_artwork = Artwork.new
		@last_artwork = @artwork_q.last
	end

	def q
		@artwork_q = Artwork.search params[:q], :conditions => {:subject => params[:artwork][:subject_ids], :location => params[:artwork][:location_ids], :artist_last => params[:artwork][:artist_id], :artist_first => params[:artwork][:artist_id]}, :order => params[:sort][:title]
		@last_artwork = Artwork.new
		@last_artwork = @artwork_q.last
		render 'index2'
	end

	def q2
		@artwork_q = Artwork.search params[:q], :conditions => {:subject => params[:artwork][:subject_ids], :location => params[:artwork][:location_ids], :artist_last => params[:artwork][:artist_id], :artist_first => params[:artwork][:artist_id]}, :order => params[:sort][:title]
		@last_artwork = Artwork.new
		@last_artwork = @artwork_q.last
		render 'index2'
	end

	def ajax_show
		@artwork = Artwork.find(params[:id])
		render 'ajax_return', layout: false
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
		@artwork_q = @artwork

		if @artwork.update(artwork_params)
			render action: 'index2'
		else
			render 'edit'
		end
	end

	def destroy
		@artwork = Artwork.find(params[:id])
		@artwork.destroy
		redirect_to action: 'index2'
	end

	private

		def artwork_params
			params.require(:artwork).permit(:title, :jtg, :photo, :width, :height, :artist_id, :subject_ids => [], :location_ids => [], :keyword_ids => [], :style_ids => [], :medium_ids => [])
		end
end
