class SessionsController < ApplicationController
 
  def new
    redirect_to home_path if current_user
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
       session[:user_id] = user.id
       flash[:success] = "You have successfully logged in."
       redirect_to home_path
    else
        flash[:danger] = "There is a problem with your username or password."
        redirect_to sign_in_path
     end
  end

  def destroy
    session[:user_id] = nil
    flash[:info] = "You have now signed out"
    redirect_to root_path
  end
end