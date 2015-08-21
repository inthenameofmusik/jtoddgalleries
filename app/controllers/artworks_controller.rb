class ArtworksController < ApplicationController
	before_filter :authenticate, :except => [:index2, :q, :ajax_show, :show]
	def index
		@artwork = Artwork.all
	end

	def index2
		@artwork_q ||= Artwork.paginate(page: params[:page], per_page: 32)
		@last_artwork = Artwork.new
		@last_artwork = @artwork_q.last
		@full_feature = true
		@single = false

		# render plain: @artwork_q
	end

	def index3
		@artwork_q ||= Artwork.paginate(page: params[:page], per_page: 32)
		@last_artwork = Artwork.new
		@last_artwork = @artwork_q.last
		@full_feature = true
	end

	def q
		@artwork_q = Artwork.search params[:q], :conditions => {:subject => params[:artwork][:subject_ids], :location => params[:artwork][:location_ids], :artist_last => params[:artwork][:artist_id], :style => params[:style][:title]}, :order => params[:sort][:title], :page => params[:page], :per_page => 32
		@last_artwork = Artwork.new
		@last_artwork = @artwork_q.last
		@full_feature = true
		render 'index2'
	end

	def q2
		@artwork_q = Artwork.search params[:q], :conditions => {:subject => params[:artwork][:subject_ids], :location => params[:artwork][:location_ids], :artist_last => params[:artwork][:artist_id], :style => params[:style][:title]}, :order => params[:sort][:title], :page => params[:page], :per_page => 32
		@last_artwork = Artwork.new
		@last_artwork = @artwork_q.last
		@full_feature = true
		render 'index3'
	end

	def q3
		@artwork_q = Artwork.search params[:q], :conditions => {:subjects => params[:subject_ids]}
		render 'index2'
	end

	def ajax_show
		@artwork = Artwork.find(params[:id])
		render 'ajax_return', layout: false
	end

	def show
		@artwork_q = Artwork.find(params[:id])
		@single = true
		@full_feature = true
		render "index2"
	end

	def new
		@artwork = Artwork.new
		@full_feature = true
		@keyword = Keyword.new
		@keyword_tell = "new"
	end

	def edit
		@artwork = Artwork.find(params[:id])
		@artwork_id = params[:id]
		@full_feature = true
		@keyword = Keyword.new
		@keyword_tell = "edit"
	end

	def keyword_update
		@full_feature = true
		@new_keyword = Keyword.create(title: params[:title])

		if params[:type] == "new"
			redirect_to action: "new"
		else
			@artwork = Artwork.find(params[:the_id])
			render 'edit'
		end

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
		@artwork_q = Artwork.find(params[:id])
		@single = true
		@full_feature = true

		if @artwork_q.update(artwork_params)
			render action: 'index2'
		else
			render 'edit'
		end
	end

	def destroy
		@artwork = Artwork.find(params[:id])
		@artwork.destroy
		redirect_to action: 'index3'
	end

	private

		def artwork_params
			params.require(:artwork).permit(:title, :jtg, :photo, :width, :height, :artist_id, :subject_ids => [], :location_ids => [], :keyword_ids => [], :style_ids => [], :medium_ids => [])
		end

		def keyword_params
			params.require(:keyword).permit(:title)
		end
end
