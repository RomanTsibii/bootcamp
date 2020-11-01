class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit destroy update]
  before_action :task_authorize, except: %i[show]
  before_action :set_development_plan, only: %i[index create new edit update show]

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.development_plan = @development_plan
    if @task.save
      flash[:notice] = 'Task was successfully created.'
      redirect_to development_plan_tasks_path
    else
      flash[:alert] = @task.errors.full_messages
      render :new
    end
  end

  def index
    @tasks = @development_plan.tasks.order(:id)
    @flow_steps = @development_plan.flow_steps.order(:id)
    @levels = Task.levels
  end

  def show
    authorize @task
  end

  def edit; end

  def update
    if current_user.admin?
      if @task.update(task_params)
        flash[:notice] = 'Task was successfully updated.'
        redirect_to development_plan_tasks_path
      else
        flash[:alert] = @task.errors.full_messages
        render :edit
      end
    elsif current_user.member?
      if @task.update(task_params_member)
        flash[:notice] = 'Task was successfully updated.'
        redirect_to home_dashboard_path
      else
        flash[:alert] = @task.errors.full_messages
        render :edit
      end
    end
  end

  def destroy
    flash[:alert] = @task.errors.full_messages unless @task.destroy
    redirect_to development_plans_path
  end

  private

  def set_task
    return if (@task = Task.find_by(id: params[:id]))

    flash[:alert] = "Task #{params[:id]} could not be found"
    redirect_to development_plans_path
  end

  def set_development_plan
    return if (@development_plan = DevelopmentPlan.find_by(id: params[:development_plan_id]))

    flash[:alert] = "Development plan #{params[:id]} could not be found"
    redirect_to development_plans_path
  end

  def task_params
    params.require(:task).permit(:title, :level, :flow_step_id, :description, :development_plan_id)
  end

  def task_params_member
    params.require(:task).permit(:flow_step_id)
  end

  def task_authorize
    authorize Task
  end
end
