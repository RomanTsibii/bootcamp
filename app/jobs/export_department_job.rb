class ExportDepartmentJob < ApplicationJob
  queue_as :default

  def perform(current_user_email, department)
    ExportMailer.send_department_data_as_pdf(current_user_email, department).deliver_now
  end
end
