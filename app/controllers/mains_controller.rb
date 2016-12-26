class MainsController < ApplicationController
  def index

  end
  def main

  end
  def gallary

  end
  def contact
    
  end
  def welcome
    if user_params[:email].length < 1
      flash[:error] = ["Please enter a valid email"]
      redirect_to "/"
    else
      session[:user_email] = user_params[:email]
      redirect_to "/main"
    end
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
