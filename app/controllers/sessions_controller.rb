class SessionsController < ApplicationController
  
  def new
  
  end
  
  def create
    user = User.find_by_email(params[:email])
    if user.save && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "You have logged in."
      redirect_to user_url(session[:user_id])
    else
        flash[:notice] = "Please try again!"
        redirect_to new_session_url
    end
  end
  
  def destroy
    reset_session
    flash[:notice] = "You have logged out."
    redirect_to new_session_url
  end
end
