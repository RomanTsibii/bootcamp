class HomeController < ApplicationController
  def dashboard
    @department = current_user.department
    @development_plans = current_user.department.development_plans
    @user_level = current_user.level
  end

  def index; end
end
