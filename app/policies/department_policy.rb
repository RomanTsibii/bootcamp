class DepartmentPolicy < ApplicationPolicy
  def index?
    user.admin?
  end

  def show?
    user.admin? || record == user.department
  end

  def send_pdf_to_mail
    user
  end

  def new?
    user.admin?
  end

  alias create? new?

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
