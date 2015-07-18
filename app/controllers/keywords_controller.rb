class KeywordsController < ApplicationController
	def index
		@keyword = Keyword.all
		@new_keyword = Keyword.new
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

	def destroy
		@keyword = Keyword.find(params[:id])
		@keyword.destroy

		redirect_to action: 'index'
  	end

	private

	def keyword_params
		params.require(:keyword).permit(:title)
	end
end
