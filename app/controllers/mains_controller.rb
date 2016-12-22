class MainsController < ApplicationController
  def index

  end
  def main

  end
  def welcome
    session[:user_email] = user_params[:email]
    redirect_to "/main"
  end
  def logout
    session.clear
    redirect_to :root
  end
  private
    def user_params
      params.require(:user).permit(:email)

    end
end
