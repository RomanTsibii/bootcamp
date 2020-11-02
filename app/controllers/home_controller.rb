class HomeController < ApplicationController
  def dashboard
    @department = current_user.department
    @levels = User.levels
  end

  def send_pdf_to_mail
    @department = current_user.department
    flash[:notice] = 'Email was successfully sent.' if ExportDashboardJob.perform_later(current_user.email, @department, current_user)
    redirect_to home_dashboard_path
  end

  def index; end
end
