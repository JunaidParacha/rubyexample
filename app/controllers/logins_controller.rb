class LoginsController < ApplicationController
  before_action :require_login, except: ['login', 'reg', 'index']
  before_action :logedin, except: ['edit', 'logout', 'update']

  def index
  end
  def login
    user = User.find_by(email:login_params[:email].downcase)
    if user && user.authenticate(login_params[:password])
      session[:user] = user.id
      session[:username]= "#{user.first_name} #{user.Last_name}"

      redirect_to '/events'
    else
      flash[:error] = ["Invalid User"]
      redirect_to :root
    end
  end
  def reg
    user = User.new(reg_params)
    if user.save
      redirect_to '/events'
      session[:user] = user.id
      session[:username]= "#{user.first_name} #{user.Last_name}"
    else
      flash[:error] = user.errors.full_messages
      redirect_to :root
    end
  end
  def logout
    session.clear
    redirect_to :root
  end
  def edit
    @user = User.find(params[:id])
    redirect_to "/logins/#{current_user.id}/edit" if current_user != @user
    session[@user.state] = 'selected'
  end
  def update
    User.update(params[:id],update_params)
    flash[:sucess] = "You have updated your profile"
    redirect_to "/logins/#{session[:user]}/edit"
  end
  private
    def login_params
      params.require(:login).permit(:email, :password)
    end
    def reg_params
      params.require(:reg).permit(:email, :password, :password_confirmation, :first_name, :Last_name, :location, :state)
    end
    def update_params
      params.require(:update).permit(:email, :first_name, :Last_name, :location, :state)
    end
end
