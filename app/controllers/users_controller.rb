class UsersController < ApplicationController
  def index
    @users = User.all
    authorize @users
    # UsersMailer.invite_member('invate1@gmail.com').deliver_later
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def edit
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    authorize @user
    if @user.update(user_params)
      flash[:notice] = 'Saved...'
      redirect_to user_path(@user)
    else
      flash[:alert] = 'Cannot Update...'
      render 'users/edit'
    end
  end

  def destroy
    # add authorize @user
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :avatar)
  end
end
