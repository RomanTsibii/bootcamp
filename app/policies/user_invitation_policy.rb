class Users::InvitationsPolicy < ApplicationPolicy
  def create?
    user.admin?
  end

  alias new? create?
end
