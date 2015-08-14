class SnippetsController < ApplicationController
	def expo_now
		@the_id = params[:id]
		@entry = Snippet.new(title: "expo_now", value: @the_id)
		redirect_to controller: "exhibitions", action: "admin"
	end
end
