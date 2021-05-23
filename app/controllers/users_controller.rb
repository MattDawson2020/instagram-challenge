class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      flash[:error] = "Unable to edit user"
      redirect_to @user
    end
  end

  def create 
    @user = User.create(user_params)
    if @user.valid?
      redirect_to root_path
      flash[:newuser] = "You have created your account #{@user.name}"
    else
      flash[:error] = "There was a problem with your details"
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :image)
  end
end
