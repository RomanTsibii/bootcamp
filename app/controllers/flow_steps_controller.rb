class FlowStepsController < ApplicationController
  before_action :set_flow_step, only: %i[show edit update destroy]
  before_action :flow_step_authorize

  def index
    if params[:development_plan_id].nil?
      @flow_steps = FlowStep.order(:id)
    else
      @development_plan = DevelopmentPlan.find(params[:development_plan_id])
      @flow_steps = @development_plan.flow_steps
    end
  end

  def new
    @flow_step = FlowStep.new
  end

  def create
    @flow_step = FlowStep.new(flow_step_params)
    if @flow_step.save
      redirect_to flow_step_path(@flow_step)
    else
      flash[:alert] = "Can`t save! Input 'Title' and 'Development plan'."
      render 'new'
    end
  end

  def show; end

  def edit; end

  def update
    if @flow_step.update(flow_step_params)
      flash[:notice] = 'Save!!'
      redirect_to flow_step_path(@flow_step)
    else
      flash[:alert] = 'Don`t save!'
      render 'flow_steps/edit'
    end
  end

  def destroy
    @flow_step.destroy
    flash[:notice] = 'Flow step destroyed!'
    redirect_to flow_steps_path
  end

  private

  def set_flow_step
    @flow_step = FlowStep.find(params[:id])
  end

  def flow_step_params
    params.require(:flow_step).permit(:title, :development_plan_id)
  end

  def flow_step_authorize
    authorize FlowStep
  end
end
