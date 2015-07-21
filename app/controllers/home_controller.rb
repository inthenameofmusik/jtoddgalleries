class HomeController < ApplicationController
  def index
  	@first_one = Exhibition.order('from_date DESC').first

	if (@first_one.from_date..@first_one.to_date).cover?(DateTime.now.to_date)
		@correct_version = "Now Showing"
	else
		@correct_version = "Soon Showing"
	end
	
  	@full_feature = false
  end
end
