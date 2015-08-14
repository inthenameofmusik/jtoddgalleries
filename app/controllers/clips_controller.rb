class ClipsController < ApplicationController
	def expo_now
		@the_id = params[:id]
		@entry = Clip.where("title = 'expo_now'").first
		@entry.value = @the_id
		@entry.save
		redirect_to controller: "exhibitions", action: "admin"
	end

	def expo_upcoming
		@the_id = params[:id]
		@entry = Clip.where("title = 'expo_upcoming'").first
		@entry.value = @the_id
		@entry.save
		redirect_to controller: "exhibitions", action: "admin"
	end
end
