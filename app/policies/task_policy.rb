class TaskPolicy < ApplicationPolicy
  def index?
    user.admin?
  end

  def show?
    user.admin? || user_tasks_eq_task?
  end

  def create?
    user.admin?
  end

  alias new? create?

  def update?
    true
  end

  def edit?
    user.admin?
  end

  def destroy?
    user.admin?
  end

  def user_tasks_eq_task?
    user.department.development_plans.each do |development_plan|
      development_plan.tasks.each do |task|
        false unless task == record
      end
    end
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
