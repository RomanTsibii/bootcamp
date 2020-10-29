module Users
  class InvitationsPolicy < ApplicationPolicy
    def create?
      user.admin?
    end

    alias new? create?
  end
end
