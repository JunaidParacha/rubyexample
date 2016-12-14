class EventsController < ApplicationController
  before_action :require_login
  def index
    @instate = Even.where(['date > ?', Date.today]).where(state:current_user.state).includes(:user)
    @outstate = Even.where(['date > ?', Date.today]).where(['state != ?', current_user.state]).includes(:user)
    @userevents = Join.where(user: session[:user]).select("joins.even_id")
  end
  def create
    event = Even.new(event_params.merge(user: User.find(session[:user])))
    flash[:error] = event.errors.full_messages unless event.save
    redirect_to '/events'
  end
  def join_event
    if not Join.find_by( user: User.find(session[:user]), even: Even.find(params[:id]))
      Join.create( user: User.find(session[:user]), even: Even.find(params[:id]))
    end
    redirect_to '/events'
  end
  def cancel_event
    Join.find_by(user: User.find(session[:user]), even: Even.find(params[:id])).destroy
    redirect_to '/events'
  end
  def show
    @event = Even.includes(:user).find(params[:id])
    @eventcount = Join.includes(:user).where(even:Even.find(params[:id]))
    @comments = Comment.where(even:Even.find(params[:id])).includes(:user)
  end
  def comment_create
    Comment.create(comment_params.merge(user:User.find(session[:user])))
    redirect_to "/events/#{comment_params[:even_id]}"
  end
  # def logout
  #   session.clear
  #   redirect_to :root
  # end
  private
    def event_params
      params.require(:event).permit(:name, :location, :state, :date)
    end
    def comment_params
      params.require(:comment).permit(:comment, :even_id)
    end
end
