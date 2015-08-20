class AboutController < ApplicationController
	before_filter :authenticate, :only => [:admin]

  def gallery
  	@full_feature = true
    @gallery_text = GallerySnippet.first
  end

  def staff
  	@full_feature = true
  end

  def admin
  	
  end

  def update
    @about = GallerySnippet.all.first

    if @about.update(about_params)
      redirect_to action: 'gallery'
    else
      redirect_to action: "gallery_admin"
    end
  end

  def gallery_admin
    @full_feature = true
    @about = GallerySnippet.all.first
    render 'edit'
  end

  private

  def about_params
    params.require(:gallery_snippet).permit(:value)
  end

end

