class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in?, :avtar_selector

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def redirect_if_logged_in
    if logged_in?
      flash[:error] = "You are already logged in."
      redirect_to chatroom_path
    end
  end

  def require_user
    if !logged_in?
      flash[:error] = "You must be logged in to perform that action."
      redirect_to login_path
    end
  end

  def avtar_selector(user)
    if current_user
      if user.id == 1
        "avtar-beard.png"
      elsif user.username == "anonymous"
        "avtar-anonymous.png"
      else
        "avtar-#{user.id.modulo(3)}.png"
      end
    end
  end
end
