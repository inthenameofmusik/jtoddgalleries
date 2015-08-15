class ArticlesController < ApplicationController
	before_action :set_article, only: [:show, :edit, :update, :destroy]
	before_filter :authenticate, :only => [:admin]


	def index
		@article = Article.order('published_date DESC').all
		@full_feature = true
	end

	def show
		@article = Article.find(params[:id])
	end

	def new
		@article = Article.new
		@full_feature = true
	end

	def create
		@article = Article.new(article_params)

		if @article.save
			redirect_to action: "admin", notice: 'Article was successfully created'
		else
			render action: 'new'
		end

	end

	def update
		if @article.update(article_params)
			redirect_to action: "admin", notice: "Article successfully updated"
		else
			render action: "edit"
		end
	end

	def ajax_show
		@article = Article.find(params[:id])
		render 'ajax_return', layout: false
	end

	def admin
		@article = Article.order('published_date DESC').all
		@full_feature = true
	end

	def destroy
		@article.destroy
		redirect_to action: "admin", notice: "Article deleted"
	end

	private

	def article_params
		params.require(:article).permit(:id, :title, :body, :published_date)
	end

	def set_article
		@article = Article.find(params[:id])
	end
end
