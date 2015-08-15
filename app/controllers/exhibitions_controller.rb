class ExhibitionsController < ApplicationController
	before_filter :authenticate, :except => [:index, :get_current, :get_upcoming, :show]
	before_filter :fullfeature

	def index
		@first_one = Exhibition.order('from_date DESC').first
		if @first_one.present? && @first_one.to_date.present?
			if (@first_one.from_date..@first_one.to_date).cover?(DateTime.now.to_date)
				@correct_version = "Now Showing"
			else
				@correct_version = "Soon Showing"
			end
		else
			@correct_version = "Now Showing"
		end

		@exhibition = Exhibition.order('from_date DESC')
		@full_feature = true
	end

	def get_current
		    @now_expo = Clip.where("title = 'expo_now'").first.value.to_i
   			 @exhibition = Exhibition.find(@now_expo)
		# @first_one = Exhibition.order('from_date DESC').first

		@correct_version = "Now Showing"
		@correct2 = "Upcoming"

		# @exhibition = Exhibition.order('from_date DESC').first
		render 'show'
	end

	def get_upcoming
		@upcoming_expo = Clip.where("title = 'expo_upcoming'").first.value.to_i
		@exhibition = Exhibition.find(@upcoming_expo)
		@correct_version = "Now Showing"
		render 'show2'
	end

	def admin
		@exhibition = Exhibition.order('from_date DESC')
		render 'admin'
	end

	def new
		@exhibition = Exhibition.new
	end

	def edit
		@exhibition = Exhibition.find(params[:id])
	end

	def create
		@exhibition = Exhibition.new(exhibition_params)

		if @exhibition.save
			redirect_to action: 'admin'
		else
			render 'new'
		end
	end

	def show
		@first_one = Exhibition.order('from_date DESC').first

		@correct_version = "Now Showing"

		@exhibition = Exhibition.find(params[:id])
		render 'show3'
	end

	def update
		@exhibition = Exhibition.find(params[:id])

		if @exhibition.update(exhibition_params)
			redirect_to action: 'admin'
		else
			render 'edit'
		end
	end

	def destroy
		@exhibition = Exhibition.find(params[:id])
		
		if @exhibition.destroy
			redirect_to action: 'admin'
		else
			redirect_to action: 'admin'
		end
	end

	private

	def fullfeature
		@full_feature = true
	end

	def exhibition_params
		params.require(:exhibition).permit(:main_photo, :title, :description, :admission, :link , :artist_id, :from_date, :to_date, :alt_photo_1, :alt_photo_2, :alt_photo_3)
	end
end
