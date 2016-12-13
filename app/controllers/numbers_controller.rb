class NumbersController < ApplicationController
  def index
    if not session[:num]
      session[:num] = rand 1..100
    end
  end
  def guess
    puts params[:number]
    if params[:number].to_i < session[:num]
      flash[:num] = "#{params[:number]} is too low!"
      flash[:color] = "Red"
      redirect_to '/'
    elsif params[:number].to_i > session[:num]
      flash[:num] = "#{params[:number]} is too high!"
      flash[:color] = "Red"
      redirect_to '/'
    elsif params[:number].to_i == session[:num]
      flash[:correct] = "#{params[:number]} is correct!"
      flash[:color] = "Green"
      session.clear
      redirect_to '/'
    end
  end
end
