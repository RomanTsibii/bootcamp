class DepartmentPolicy < ApplicationPolicy

  def index?
    user.admin?
  end

  def new?
    user.admin?
  end

  alias create? new?

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
