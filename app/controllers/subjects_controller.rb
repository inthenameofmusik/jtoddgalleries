class SubjectsController < ApplicationController
	before_filter :set_subject, only: [:edit, :update]

	def index
		@subject = Subject.order("lower(title) ASC").all
		@new_subject = Subject.new
		@full_feature = true
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

	def edit
		@full_feature = true
	end

	def update
		if @subject.update(subject_params)
			redirect_to action: 'index'
		else
			redirect_to action: 'edit'
		end
	end

	def destroy
		@subject = Subject.find(params[:id])
		@subject.destroy

		redirect_to action: 'index'
  	end

	private

	def set_subject
		@subject = Subject.find(params[:id])
	end

	def subject_params
		params.require(:subject).permit(:title)
	end
end
