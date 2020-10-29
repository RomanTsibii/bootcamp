class DevelopmentPlansController < ApplicationController
  before_action :set_development_plan, only: %i[edit show update destroy]
  before_action :development_plan_authorize

  def index
    @development_plans = DevelopmentPlan.order(:id)
  end

  def new
    @development_plan = DevelopmentPlan.new
  end

  def create
    @development_plan = DevelopmentPlan.new(development_plan_params)
    if @development_plan.save
      flash[:notice] = 'Development plan was successfully created.'
      redirect_to development_plan_path(@development_plan)
    else
      flash[:alert] = @development_plan.errors.messages
      render :new
    end
  end

  def edit; end

  def show; end

  def update
    if @development_plan.update(development_plan_params)
      flash[:notice] = 'Development plan was successfully updated.'
      redirect_to development_plan_path(@development_plan)
    else
      flash[:alert] = @development_plan.errors.messages
      render :edit
    end
  end

  def destroy
    flash[:alert] = @development_plan.errors.messages unless @development_plan.destroy
    redirect_to development_plans_path
  end

  private

  def development_plan_params
    params.require(:development_plan).permit(:title, :department_id)
  end

  def set_development_plan
    return if (@development_plan = DevelopmentPlan.find_by(id: params[:id]))

    flash[:alert] = "Development plan #{params[:id]} could not be found"
    redirect_to development_plans_path
  end

  def development_plan_authorize
    authorize DevelopmentPlan
  end
end
