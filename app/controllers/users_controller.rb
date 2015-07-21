class UsersController < ApplicationController

  before_action :is_authenticated, except: [:new, :index]

  def index
  end

  def new
    @user = User.new
  end

  def create
    signup = User.create user_params
    if signup
      flash[:success] = "Account Created"
      session[:user_id] = signup.id
      redirect_to posts_path
    else
      flash[:danger] = "Please provide valid a valid email, username (twenty characters or less), and password."
      redirect_to login_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :name)
  end

end



