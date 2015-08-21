class LocationsController < ApplicationController
	before_filter :set_location, only: [:edit, :update]

	def index
		@location = Location.order("lower(title) ASC").all
		@new_location = Location.new
		@full_feature = true
	end

	def create
		@location = Location.new(location_params)

		if @location.save
			flash[:success] = "Location Attribute Added"
			redirect_to action: 'index'
		else
			flash[:error] = "That record already exists"
			redirect_to action: 'index'
		end
	end

	def edit
		@full_feature = true
	end

	def update
		if @location.update(location_params)
			redirect_to action: 'index'
		else
			redirect_to action: 'edit'
		end
	end

	def destroy
		@location = Location.find(params[:id])
		@location.destroy

		redirect_to action: 'index'
  	end

	private

	def set_location
		@location = Location.find(params[:id])
	end

	def location_params
		params.require(:location).permit(:title)
	end
end
