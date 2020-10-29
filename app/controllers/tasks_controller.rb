class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit destroy update]
  before_action :task_authorize

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:notice] = 'Task was successfully created.'
      redirect_to task_path(@task)
    else
      flash[:alert] = @task.errors.messages
      render :new
    end
  end

  def index
    @tasks = Task.order(:id)
    @flow_steps = FlowStep.order(:id)
  end

  def show; end

  def edit; end

  def update
    if @task.update(task_params)
      flash[:notice] = 'Task was successfully updated.'
      redirect_to task_path(@task)
    else
      flash[:alert] = @task.errors.messages
      render :edit
    end
  end

  def destroy
    flash[:alert] = @task.errors.messages unless @task.destroy
    redirect_to tasks_path
  end

  private

  def set_task
    return if (@task = Task.find_by(id: params[:id]))

    flash[:alert] = "Task #{params[:id]} could not be found"
    redirect_to tasks_path
  end

  def task_params
    params.require(:task).permit(:title, :level, :flow_step_id, :description)
  end

  def task_authorize
    authorize Task
  end
end
