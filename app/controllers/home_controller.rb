class HomeController < ApplicationController
  def dashboard
    @department = current_user.department
    @levels = User.levels
  end

  def index; end
end
