class DepartmentsController < ApplicationController

  def index
    @departments = Department.all
    authorize @departments
  end

  def new
    @department = Department.new
    authorize @department
  end

  def create
    @department = Department.new(department_params)
    authorize @department
    if @department.save
      redirect_to departments_path
    else
      render 'new'
    end
  end

  private
  def department_params
    params.require(:department).permit(:title, :image)
  end
end
