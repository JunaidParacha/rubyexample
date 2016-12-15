class WelcomesController < ApplicationController
  # before_action :require_login, except: ['login', 'reg', 'index']
  before_action :logedin, except: ['logout']
  def index

  end
  def login
    user = User.find_by(email:login_params[:email].downcase)
    if user && user.authenticate(login_params[:password])
      session[:user] = user.id
      session[:username] = user.first_name
      redirect_to '/shoes'
    else
      flash[:error] = ["Invalid User"]
      redirect_to '/'
    end
  end
  def reg
    user = User.new(reg_params)
    if user.save
      session[:user] = user.id
      session[:username] = user.first_name
      redirect_to '/shoes'
    else
      flash[:error] = user.errors.full_messages
      redirect_to '/'
    end
  end
  def logout
    session.clear
    redirect_to :root
  end
  private
    def login_params
      params.require(:login).permit(:email, :password)
    end
    def reg_params
      params.require(:reg).permit(:email, :password, :password_confirmation, :first_name, :last_name)
    end

end
