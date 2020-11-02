class ExportMailer < ApplicationMailer
  default from: 'bootcamp_roman@coax.com'

  def send_department_data_as_pdf(current_user_email, department)
    pdf = WickedPdf.new.pdf_from_string(
      ActionController::Base.new.render_to_string('pdf/departments/show', layout: 'pdf.html.haml', locals: { department: department })
    )
    attachments['department.pdf'] = { mime_type: 'application/pdf',
                                      content: pdf }
    mail(to: current_user_email, subject: 'pdf', template_name: 'send_department_data_as_pdf')
  end

  def send_dashboard_data_as_pdf(current_user_email, department, current_user)
    pdf = WickedPdf.new.pdf_from_string(
      ActionController::Base.new.render_to_string('pdf/home/dashboard', layout: 'pdf.html.haml', locals: { department: department, current_user: current_user })
    )

    attachments['dashboard.pdf'] = { mime_type: 'application/pdf',
                                     content: pdf }
    mail(to: current_user_email, subject: 'pdf', template_name: 'send_dashboard_data_as_pdf')
  end
end
