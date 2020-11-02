class DepartmentsController < ApplicationController
  before_action :set_department, only: %i[edit update show destroy]
  before_action :department_authorize, except: %i[show send_pdf_to_mail]

  def index
    @departments = Department.order(:id)
  end

  def new
    @department = Department.new
  end

  def edit; end

  def update
    if @department.update(department_params)
      flash[:notice] = 'Department was successfully updated.'
      redirect_to department_path(@department)
    else
      flash[:alert] = @department.errors.full_messages
      render :edit
    end
  end

  def show
    authorize @department
  end

  def create
    @department = Department.new(department_params)
    if @department.save
      flash[:notice] = 'Department was successfully created.'
      redirect_to department_path(@department)
    else
      flash[:alert] = @department.errors.full_messages
      render :new
    end
  end

  def destroy
    flash[:alert] = @department.errors.full_messages unless @department.destroy
    redirect_to departments_path
  end

  def send_pdf_to_mail
    @department = Department.find_by(id: params[:department_id])
    flash[:notice] = 'Mail was successfully sent.' if ExportDepartmentJob.perform_later(current_user.email, @department)
    redirect_to department_path(@department)
  end

  private

  def set_department
    return if (@department = Department.find_by(id: params[:id]))

    flash[:alert] = "Department #{params[:id]} could not be found."
    redirect_to departments_path
  end

  def department_params
    params.require(:department).permit(:title, :image)
  end

  def department_authorize
    authorize Department
  end
end
