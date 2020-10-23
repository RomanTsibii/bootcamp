class DepartmentsController < ApplicationController
  after_action :department_authorize, only: %i[new show create]

  def index
    @departments = Department.all
    authorize @departments
  end

  def new
    @department = Department.new
    DepartmentMailer.new_department(current_user).deliver_later
  end

  def show
    @department = Department.find(params[:id])
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
