class EmployeesController < ApplicationController
	before_action :set_employee, only: [:show, :edit, :update, :destroy]
	before_filter :authenticate, :except => [:index]

	def index
		@full_feature = true
		@employees = Employee.all.order("created_at ASC")
	end

	def new
		@employee = Employee.new
		@full_feature = true
	end

	def edit
		@full_feature = true
	end

	def create
		@employee = Employee.new(employee_params)

		if @employee.save
			redirect_to action: "index", notice: "Employee successfully added"
		else
			render action: "new"
		end
	end

	def update
		if @employee.update(employee_params)
			redirect_to action: "index", notice: "Employee succesfully updated"
		else
			render action: "edit"
		end
	end

	def admin
		@full_feature = true
		@employees = Employee.all
	end

	def destroy
		@employee.destroy
		redirect_to action: "admin"
	end

	private

	def set_employee
		@employee = Employee.find(params[:id])
	end

	def employee_params
		params.require(:employee).permit(:name, :role, :bio, :staff_photo)
	end

end
