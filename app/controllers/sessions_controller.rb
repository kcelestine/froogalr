class SessionsController < ApplicationController

  def new
  end

  def create 
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:current_user] = user.id
      redirect_to(root_path)
    else 
      flash[:notice] = "You entered an incorrect username or password."
    end
  end

  def destroy
    session[:current_user] = nil
    redirect_to(root_path)
    flash[:notice] = "You have been logged out!"
  end

end