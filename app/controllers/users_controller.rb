class UsersController < ApplicationController

  before_action :find_user, only: [:show, :edit, :update, :destroy]
  
  def new
    @user = User.new
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "You have successfully edited your account"
      redirect_to @user
    else
      flash[:error] = "Unable to edit user"
      render 'edit'
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
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :image)
  end

  def find_user
    @user = User.find(params[:id])
  end

end
