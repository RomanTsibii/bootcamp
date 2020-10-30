class ExportMailer < ApplicationMailer
  default from: 'bootcamp_roman@coax.com'

  def send_department_data_as_pdf(email)
    pdf =  WickedPdf.new.pdf_from_string(
        ActionController::Base.new.render_to_string('pdf/show.html.haml', layout: 'pdf.html.haml', locals: { department: Department.last })
    )
    attachments['department.pdf'] = { mime_type: 'application/pdf',
                                      content: pdf}
    mail(to: email, subject: 'pdf', template_name: 'send_department_data_as_pdf')
  end
end
