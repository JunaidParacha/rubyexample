class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def require_login
    redirect_to '/' if session[:user] == nil
  end
  def logedin
    redirect_to '/events' if session[:user] != nil
  end
  def require_correct_user
    user = User.find(params[:id])
    redirect_to "/users/#{current_user.id}" if current_user != user
  end
  def current_user
    User.find(session[:user]) if session[:user] != nil
  end
end
