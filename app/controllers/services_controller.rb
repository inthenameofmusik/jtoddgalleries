class ServicesController < ApplicationController
	before_action :set_service, only: [:show, :edit, :update, :destroy]
	before_filter :authenticate, :except => [:index]


	def index
		@full_feature = true
		@services = Service.all
	end

	def new
		@service = Service.new
		@full_feature = true
	end

	def edit
		@full_feature = true
	end

	def create
		@service = Service.new(service_params)
		if @service.save
			redirect_to action: "index", notice: "Service successfully added"
		else
			render action: "new"
		end
	end

	def update
		if @service.update(service_params)
			redirect_to action: "index", notice: "Service successfully updated"
		else
			render action: "edit"
		end
	end

	def admin
		@full_feature = true
		@services = Service.all
	end

	private

	def set_service
		@service = Service.find(params[:id])
	end

	def service_params
		params.require(:service).permit(:title, :description, :main_photo)
	end
end
