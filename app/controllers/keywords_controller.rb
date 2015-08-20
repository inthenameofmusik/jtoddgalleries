class KeywordsController < ApplicationController
	before_filter :set_keyword, only: [:edit, :update]
	def index
		@keyword = Keyword.all
		@new_keyword = Keyword.new
		@full_feature = true
	end

	def edit
		@full_feature = true
	end

	def create
		@keyword = Keyword.new(keyword_params)

		if @keyword.save
			flash[:success] = "Keyword Attribute Added"
			redirect_to action: 'index'
		else
			flash[:error] = "That record already exists"
			redirect_to action: 'index'
		end
	end

	def update
		if @keyword.update(keyword_params)
			redirect_to action: 'index'
		else
			redirect_to action: 'edit'
		end
	end

	def destroy
		@keyword = Keyword.find(params[:id])
		@keyword.destroy

		redirect_to action: 'index'
  	end

	private

	def set_keyword
		@keyword = Keyword.find(params[:id])
	end

	def keyword_params
		params.require(:keyword).permit(:title)
	end
end
