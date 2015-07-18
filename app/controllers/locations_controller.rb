class LocationsController < ApplicationController
	def index
		@location = Location.order("lower(title) ASC").all
		@new_location = Location.new
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

	def destroy
		@location = Location.find(params[:id])
		@location.destroy

		redirect_to action: 'index'
  	end

	private

	def location_params
		params.require(:location).permit(:title)
	end
end
