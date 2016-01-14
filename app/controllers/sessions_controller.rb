class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "#{user.first_name}: 成功登录"
      redirect_to root_path
    else
      flash[:error] = "对不起，用户名或者密码错误！"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = '已退出'
    redirect_to root_path
  end

end