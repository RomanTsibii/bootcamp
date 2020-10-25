class UsersController < ApplicationController
  before_action :user_find, only: %i[show edit update destroy]
  before_action :user_authorize

  def index
    @users = User.order(:id)
    # UsersMailer.invite_member('invate1@gmail.com').deliver_later
  end

  def show; end

  def edit; end

  def update
    if @user.update(user_params)
      flash[:notice] = 'Saved...'
      redirect_to user_path(@user)
    else
      flash[:alert] = 'Cannot Update...'
      render 'users/edit'
    end
  end

  def destroy
    byebug
    @user.destroy
    flash[:notice] = 'User deleted!'
    redirect_to users_path
  end

  private

  def user_find
    @user = User.find(params[:id])
  end

  def user_authorize
    authorize User
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :avatar, :department_id)
  end
end
