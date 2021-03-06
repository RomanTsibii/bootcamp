class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:invite,            keys: %i[department_id level role])
    devise_parameter_sanitizer.permit(:accept_invitation, keys: %i[first_name last_name avatar])
    devise_parameter_sanitizer.permit(:account_update,    keys: %i[first_name last_name avatar level role department_id password password_confirmation current_password])
  end

  def user_not_authorized
    redirect_to(request.referrer || root_path)
  end
end
