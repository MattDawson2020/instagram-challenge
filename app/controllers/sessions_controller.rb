class SessionsController < ApplicationController

  # def new
  # end

  def create 
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to jams_path
      flash[:notice] = "Welcome #{@user.name}"
    else
      redirect_to root_path
      flash[:error] = "Your login details were incorrect"
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end

end
