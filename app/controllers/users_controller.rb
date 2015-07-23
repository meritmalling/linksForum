class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create user_params
    if @user.errors.any?
      flash[:danger] = "Please provide valid a valid email, username
      (twenty characters or less), and password."
      redirect_to signup_path
    else
      flash[:success] = "Account Created"
      redirect_to login_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :name)
  end

end

