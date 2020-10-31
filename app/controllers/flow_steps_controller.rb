class FlowStepsController < ApplicationController
  before_action :set_flow_step, only: %i[show edit update destroy]
  before_action :flow_step_authorize
  before_action :set_development_plan, only: %i[index create new update destroy]

  def index
    @flow_steps = @development_plan.flow_steps.order(:id)
  end

  def new
    @flow_step = FlowStep.new
  end

  def create
    @flow_step = FlowStep.new(flow_step_params)
    @flow_step.development_plan = @development_plan
    if @flow_step.save
      flash[:notice] = 'Flow step was successfully created.'
      redirect_to development_plan_flow_steps_path
    else
      flash[:alert] = @flow_step.errors.full_messages
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @flow_step.update(flow_step_params)
      flash[:notice] = 'Flow step was successfully updated.'
      redirect_to development_plan_flow_steps_path(@development_plan)
    else
      flash[:alert] = @flow_step.errors.full_messages
      render :edit
    end
  end

  def destroy
    flash[:alert] = @flow_step.errors.full_messages unless @flow_step.destroy
    redirect_to development_plan_flow_steps_path(@development_plan)
  end

  private

  def set_flow_step
    return if (@flow_step = FlowStep.find_by(id: params[:id]))

    flash[:alert] = "Flow step #{params[:id]} could not be found"
    redirect_to development_plan_flow_steps_path(@development_plan)
  end

  def set_development_plan
    return if (@development_plan = DevelopmentPlan.find_by(id: params[:development_plan_id]))

    flash[:alert] = "Development plan #{params[:id]} could not be found"
    redirect_to development_plans_path
  end

  def flow_step_params
    params.require(:flow_step).permit(:title, :development_plan_id)
  end

  def flow_step_authorize
    authorize FlowStep
  end
end
