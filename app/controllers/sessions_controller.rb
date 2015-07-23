class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.authenticate(params[:user][:email],
      params[:user][:password])
    if @user
      session[:user_id] = @user.id
      flash[:success] = 'Logged In.'
      redirect_to posts_path
    else
      flash[:danger] = 'Invalid email or password.'
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:info] = "Loged Out."
    redirect_to login_path
  end

end
