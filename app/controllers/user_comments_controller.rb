class UserCommentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :new]

  def create
    @user_comment = current_user.user_comments.build(user_comment_params)

    if @user_comment.save
      #current_user.user_comments << @user_comment
      flash[:success] = "Comment posted!"
      redirect_to new_user_comment_path
    else
      flash[:danger] = "Comment FAIL!"
      redirect_to new_user_comment_path
    end
  end
  
  def new
    @user_comment = UserComment.new
  end

  private

    def user_comment_params
      params.require(:user_comment).permit(:content, :appointment_id)
    end
end
