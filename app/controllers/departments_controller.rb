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
      flash[:notice] = 'Department was successfully updated.'
      redirect_to department_path(@department)
    else
      flash[:alert] = @department.errors.messages
      render :edit
    end
  end

  def show
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Department No. #{@department.id}",
               page_size: 'A4',
               template: 'departments/show.html.haml',
               layout: 'pdf.html',
               orientation: 'Landscape',
               lowquality: true,
               zoom: 1,
               dpi: 75
      end
    end
  end

  def create
    @department = Department.new(department_params)
    if @department.save
      flash[:notice] = 'Department was successfully created.'
      redirect_to department_path(@department)
    else
      flash[:alert] = @department.errors.messages
      render :new
    end
  end

  def destroy
    flash[:alert] = @department.errors.messages unless @department.destroy
    redirect_to departments_path
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
