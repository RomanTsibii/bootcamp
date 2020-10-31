class ExportDepartmentJob < ApplicationJob
  queue_as :default

  def perform(email)
    ExportMailer.send_department_data_as_pdf(email).deliver_now
  end
end
