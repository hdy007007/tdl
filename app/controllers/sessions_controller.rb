class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "#{user.first_name}: You have successfully logged in"
      redirect_to root_path
    else
      flash[:error] = "Sorry, something is incorrect"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'You logged out'
    redirect_to root_path
  end

end