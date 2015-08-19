class FactsController < ApplicationController
	before_action :set_fact, only: [:show, :edit, :update, :destroy]

	def admin
		@facts = Fact.all
		@full_feature = true
	end

	def new
		@fact = Fact.new
		@full_feature = true
	end

	def edit
		@full_feature = true
	end

	def ajax_show
		@fact = Fact.order("RANDOM()").first
		render 'ajax_return', layout: false
	end

	def create
		@fact = Fact.new(fact_params)
		if @fact.save
			redirect_to action: "admin", notice: "Fact successfully added"
		else
			render action: "new"
		end
	end

	def update
		if @fact.update(fact_params)
			redirect_to action: "admin", notice: "Fact successfully updated"
		else
			render action: "new"
		end
	end

	def destroy
		@fact.destroy

		redirect_to action: "admin"
	end

	private


	def set_fact
		@fact = Fact.find(params[:id])
	end

	def fact_params
		params.require(:fact).permit(:phrase)
	end
end
