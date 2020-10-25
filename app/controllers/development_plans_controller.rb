class DevelopmentPlansController < ApplicationController
  before_action :development_plan_find, only: %i[edit show update destroy]
  before_action :development_plan_authorize

  def index
    @development_plans = DevelopmentPlan.order(:id)
  end

  def new
    @development_plan = DevelopmentPlan.new
  end

  def create
    @development_plan = DevelopmentPlan.new(development_plan_params)
    @department = Department.all
    if @development_plan.save
      redirect_to development_plan_path(@development_plan)
    else
      render 'development_plans/new'
    end
  end

  def edit; end

  def show; end

  def update
    if @development_plan.update(development_plan_params)
      flash[:notice] = 'Save!!'
      redirect_to development_plan_path(@development_plan)
    else
      flash[:alert] = 'Don`t save!'
      render 'development_plans/edit'
    end
  end

  def destroy
    @development_plan.destroy
    flash[:notice] = 'Development plan destroyed!'
    redirect_to development_plans_path
  end

  private

  def development_plan_params
    params.require(:development_plan).permit(:title, :department_id)
  end

  def development_plan_find
    @development_plan = DevelopmentPlan.find(params[:id])
  end

  def development_plan_authorize
    authorize DevelopmentPlan
  end
end
