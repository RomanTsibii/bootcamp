class UserController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = current_user
    if @user.update_attributes(current_user_params)
      flash[:notice] = "Saved..."
      redirect_to root_path
    else
      flash[:alert] = "Cannot Update..."
      render 'user/edit'
    end
  end

  private

  def current_user_params
    params.permit(:first_name, :last_name, :avatar)
  end

end
