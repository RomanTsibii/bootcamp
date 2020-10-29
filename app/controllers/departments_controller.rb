class DepartmentsController < ApplicationController
  before_action :set_department, only: %i[edit update show destroy]
  before_action :department_authorize

  def index
    @departments = Department.order(:id)
  end

  def new
    @department = Department.new
  end

  def edit; end

  def update
    if @department.update(department_params)
      flash[:notice] = 'Save!!'
      redirect_to department_path(@department)
    else
      flash[:alert] = 'Don`t save!'
      render 'departments/edit'
    end
  end

  def show; end

  def create
    @department = Department.new(department_params)
    if @department.save
      redirect_to department_path(@department)
    else
      render 'new'
    end
  end

  def destroy
    if @department.users.count == 0
      @department.destroy
      flash[:notice] = 'Department destroyed!'
      redirect_to departments_path
    else
      flash[:alert] = "Can`t destroy, department have #{@department.users.count} users"
      redirect_to department_path(@department)
    end
  end

  private

  def set_department
    return if (@department = Department.find_by(id: params[:id]))

    flash[:alert] = "Department #{params[:id]} could not be found"
    redirect_to departments_path
  end

  def department_params
    params.require(:department).permit(:title, :image)
  end

  def department_authorize
    authorize Department
  end
end
