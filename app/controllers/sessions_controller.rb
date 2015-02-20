class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "Hello #{user.username}! You are logged in!"
      redirect_to accounts_path
    else
      flash[:error] = "There is something wrong with either username or password"
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:notice] = "You've been logged out"
    redirect_to root_path
  end
end