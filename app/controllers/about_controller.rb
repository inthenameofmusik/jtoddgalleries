class AboutController < ApplicationController
	before_filter :authenticate, :only => [:admin]
  def gallery
  	@full_feature = true
  end

  def staff
  	@full_feature = true
  end

  def admin
  	
  end
end

