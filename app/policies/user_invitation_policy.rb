class Users::InvitationsPolicy < ApplicationPolicy
  def create?
    user.admin?
  end

  alias new? create?

  def edit?
    user.admin?
  end

  alias update? edit?
end
