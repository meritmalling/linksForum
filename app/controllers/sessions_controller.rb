class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.authenticate(params[:user][:email],
    params[:user][:password])
    if user
      #render json: params
      flash[:success] = "Logged In"
      session[:user_id] = user.id
      redirect_to posts_path
    else
      flash[:danger] = "Incorrect email or password."
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:info] = "Logged Out"
    redirect_to login_path
  end

end
