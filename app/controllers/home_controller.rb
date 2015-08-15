class HomeController < ApplicationController
  def index
  	# @first_one = Exhibition.order('from_date DESC').first

    @now_expo = Clip.where("title = 'expo_now'").first.value.to_i
    @first_one = Exhibition.find_by_id(@now_expo)

    @upcoming_expo = Clip.where("title = 'expo_upcoming'").first.value.to_i
    @upcoming_one = Exhibition.find_by_id(@upcoming_expo)

  	@total_art = Artwork.all.count

  	@random_one = Random.rand(0...@total_art)
  	@random_one_art = Artwork.offset(@random_one).first

  	@random_two = Random.rand(0...@total_art)
  	@random_two_art = Artwork.offset(@random_two).first

  	@random_three = Random.rand(0...@total_art)
  	@random_three_art = Artwork.offset(@random_three).first

	# if (@first_one.from_date..@first_one.to_date).cover?(DateTime.now.to_date)
	# 	@correct_version = "Now Showing"
	# else
	# 	@correct_version = "Soon Showing"
	# end

	@correct_version = "Now Showing"
	
  	@full_feature = false
  end

  def new_feature
  	@id_choice = params["which_one"].to_i - 1
  	@the_work = Artwork.offset(@id_choice).first

  	respond_to do |format|
  		format.json {
  			render :json => {
	  			:title => @the_work.title,
	  			:id => @the_work.id,
	  			:photo => @the_work.photo.url(:detail)
  			}
  		}
  	end

  end


end
