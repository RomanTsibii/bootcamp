class ApplicationController < ActionController::Base
  include Pundit
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:accept_invitation, keys: %i[first_name last_name avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name avatar password password_confirmation current_password])
  end
end
