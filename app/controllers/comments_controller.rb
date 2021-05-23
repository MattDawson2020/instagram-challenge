class CommentsController < ApplicationController
  before_action :current_user

    def new
      @comment = Comment.new
      @jam = Jam.find_by(params[:jam_id])
    end
  
    def create
      @comment = @user.comments.create(comment_params)
      @jam_owner = User.find(@comment.user_id)   
      @jam = Jam.find(@comment.jam_id)  
      if @comment.valid?
        redirect_to jam_path(@jam.id)
        flash[:newuser] = "You have commented on #{@jam_owner.name}'s post!"
      else
        flash[:error] = "Your comment could not be created"
        redirect_to new_comment_path
      end
  
    end

  
    private 
  
    def comment_params
      params.require(:comment).permit(:body, :user_id, :jam_id)
    end

    def current_user
      @user = User.find(session[:user_id])
    end
  
end
