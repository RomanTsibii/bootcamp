class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit destroy update]
  before_action :task_authorize

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to task_path(@task)
    else
      render 'new'
    end
  end

  def index
    @tasks = Task.all
  end

  def show; end

  def edit; end

  def update
    if @task.update(task_params)
      flash[:notice] = 'Save!!'
      redirect_to task_path(@task)
    else
      flash[:alert] = 'Don`t save!'
      render 'tasks/edit'
    end
  end

  def destroy
    @task.destroy
    flash[:notice] = 'Task destroyed!'
    redirect_to tasks_path
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :development_plan_id, :level, :flow_step_id )
  end

  def task_authorize
    authorize Task
  end
end
