class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  before_action :user_authorize

  def index
    @users = User.order(:id)
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
    flash[:alert] = @user.errors.messages unless @user.destroy
    redirect_to users_path
  end

  private

  def set_user
    return if (@user = User.find_by(id: params[:id]))

    flash[:alert] = "User #{params[:id]} could not be found"
    redirect_to root_path
  end

  def user_authorize
    authorize User
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :avatar, :department_id, :role, :level)
  end
end
