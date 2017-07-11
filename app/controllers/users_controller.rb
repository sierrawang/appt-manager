class UsersController < ApplicationController
  before_action :logged_in_user, only: [:destroy]
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def index
    @users = User.all
  end
  
  def create
    @user = User.new(user_params)    # Not the final implementation!
    if @user.
      log_in @user
      flash[:success] = "Welcome to the Appointment Manager!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
    
    # Before filters

    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

end
