class JamsController < ApplicationController

  def new
    @jam = Jam.new
  end

  def create
    @user = User.find(session[:user_id])
    @jam = @user.jams.create(jam_params)
    p @jam
    if @jam.valid?
      redirect_to jam_path(@jam.id)
      flash[:newuser] = "You have created a new post #{@user.name}!"
    else
      flash[:error] = "Your post could not be created"
      redirect_to new_jam_path
    end

  end

  def show 
    @jam = Jam.find(params[:id])
  end

  def index
    @jams = Jam.all
  end


  private 

  def jam_params
    params.require(:jam).permit(:image, :caption)
  end
end
