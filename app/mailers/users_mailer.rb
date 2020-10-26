class UsersMailer < ApplicationMailer
  default from: 'bootcamp_roman@coax.com'

  def invite_member(email)
    @email = email
    @url = 'https://github.com/scambra/devise_invitable'
    mail(to: @email, subject: 'Invite to bootcamp')
  end
end
