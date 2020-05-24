class SessionsController < ApplicationController

  before_action :require_user, only: [:destroy]
  before_action :redirect_if_logged_in, only: [:new, :create]

  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user
      session[:user_id] = @user.id
      User.find(@user.id).update(online: true);
      flash[:success] = "You are successfully logged in."
      redirect_to chatroom_path
    else
      flash[:error] = "There was some problem with your login details."
      render 'new'
    end
  end

  def destroy
    User.find(session[:user_id]).update(online: false);
    session[:user_id] = nil
    flash[:success] = "You are successfully logged out."
    redirect_to login_path
  end

end
