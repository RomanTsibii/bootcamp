class CommentsController < ApplicationController
  before_action :set_task, %i[create]
  before_action :set_development_plan, %i[create]

  def create
    @comment = Comment.new(comment_params)
    @comment.commentable = current_user
    @comment.task = @task
    if @task.save
      flash[:notice] = 'Comment was successfully created.'
    else
      flash[:alert] = @task.errors.full_messages
    end
    redirect_to development_plan_task_path(@task.development_plan, @task)
  end

  def update; end

  def destroy; end

  private

  def set_task
    return if (@task = Task.find_by(id: params[:id]))

    flash[:alert] = "Task #{params[:id]} could not be found"
    redirect_to development_plans_path
  end

  def comment_params
    params.require(:comment).permit(:content, :commentable, :task_id)
  end

  def set_development_plan
    return if (@development_plan = DevelopmentPlan.find_by(id: params[:development_plan_id]))

    flash[:alert] = "Development plan #{params[:id]} could not be found"
    redirect_to development_plans_path
  end
end
