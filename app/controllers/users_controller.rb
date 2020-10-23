class UsersController < ApplicationController
  def index
    @users = User.all
    authorize @users
    UsersMailer.invite_member('invate1@gmail.com').deliver_later
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def new
    @user = User.new
    authorize @user
  end

  def create
    @user = User.create(current_user_params)
    authorize @user
    if @user.save
      # send invite
      redirect_to @user
    end
    render 'new'
  end

  def edit
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    authorize @user
    if @user.update_attributes(current_user_params).save
      flash[:notice] = 'Saved...'
      redirect_to department_user_path(@user)
    else
      flash[:alert] = 'Cannot Update...'
      render 'users/edit'
    end
  end

  def destroy
    # add authorize @user
  end

  private

  def current_user_params
    params.require(:post).permit(:first_name, :last_name, :avatar)
  end
end
