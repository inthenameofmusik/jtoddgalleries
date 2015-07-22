class ArticlesController < ApplicationController
	def index
		@article = Article.all
	end

	def show
		@article = Article.find(params[:id])
	end

	def ajax_show
		@article = Article.find(params[:id])
		render 'ajax_return', layout: false
	end
end
