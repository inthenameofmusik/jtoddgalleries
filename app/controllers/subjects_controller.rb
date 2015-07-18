class SubjectsController < ApplicationController
	def index
		@subject = Subject.order("lower(title) ASC").all
		@new_subject = Subject.new
	end

	def create
		@subject = Subject.new(subject_params)

		if @subject.save
			flash[:success] = "Subject Attribute Added"
			redirect_to action: 'index'
		else
			flash[:error] = "That record already exists"
			redirect_to action: 'index'
		end
	end

	def destroy
		@subject = Subject.find(params[:id])
		@subject.destroy

		redirect_to action: 'index'
  	end

	private

	def subject_params
		params.require(:subject).permit(:title)
	end
end
