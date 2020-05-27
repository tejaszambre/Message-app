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
      ActionCable.server.broadcast "online_users_channel", username: @user.username, id: @user.id
      flash[:success] = "You are successfully logged in."
      redirect_to chatroom_path
    else
      flash[:error] = "There was some problem with your login details."
      render 'new'
    end
  end

  def destroy
    @user = User.find(session[:user_id])
    @user.update(online: false);
    session[:user_id] = nil
    ActionCable.server.broadcast "offline_users_channel", id: @user.id
    flash[:success] = "You are successfully logged out."
    redirect_to login_path
  end

end
