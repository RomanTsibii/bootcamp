class DepartmentsController < ApplicationController
  before_action :department_authorize, only:[:new, :create]

  def index
    @departments = Department.all
    authorize @departments
  end

  def new
    @department = Department.new
  end

  def create
    @department = Department.new(department_params)
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

  def department_authorize
    authorize @department
  end
end
