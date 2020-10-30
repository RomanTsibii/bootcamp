class Export::Pdf::Generate < ApplicationService
  def self.call
    new.call
  end

  def call
    generate_pdf
  end

  private

  def generate_pdf
    # data = ActionController::Base.render_to_string('departments/show.html.haml')
    #
    # render pdf: "Department PDF",
    #        page_size: 'A4',
    #        template: 'departments/show.html.haml',
    #        layout: 'pdf.html',
    #        orientation: 'Landscape',
    #        lowquality: true,
    #        zoom: 1,
    #        dpi: 75
  end
end