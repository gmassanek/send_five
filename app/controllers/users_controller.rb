class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.create(params[:user])
    session[:user_id] = @user.id
    redirect_to user_url(@user)
  end
  
  def show
    @user = User.find(params[:id])
  end
  
end
