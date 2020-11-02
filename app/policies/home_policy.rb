class HomePolicy < ApplicationPolicy
  def dashboard?
    user
  end

  def index?
    true
  end

  def send_pdf_to_mail
    user
  end
end
