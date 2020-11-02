class ExportDashboardJob < ApplicationJob
  queue_as :default

  def perform(current_user_email, department, current_user)
    ExportMailer.send_dashboard_data_as_pdf(current_user_email, department, current_user).deliver_now
  end
end
