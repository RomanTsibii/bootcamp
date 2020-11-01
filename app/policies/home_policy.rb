class HomePolicy < ApplicationPolicy
  def dashboard?
    user
  end

  def index?
    true
  end
end
