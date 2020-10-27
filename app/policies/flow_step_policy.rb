class FlowStepPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.admin?
  end

  alias new? create?

  def update?
    user.admin?
  end
  alias edit? update?

  def destroy?
    user.admin?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
