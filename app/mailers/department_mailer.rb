class DepartmentMailer < ApplicationMailer
  default from: 'bootcamp_roman@coax.com'

  def new_department(user)
    @user = user
    @url  = 'http://google.com.ua'
    mail(to: @user.email, subject: 'bootcamp_new_department')
  end
end
