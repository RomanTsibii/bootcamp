class Users::InvitationsController < Devise::InvitationsController
  before_action :user_authorize

  def new
    super
  end

  def create
    super
  end

  def edit
    super
  end

  def update
    super
  end

  private

  def user_authorize
    authorize User
  end
end
