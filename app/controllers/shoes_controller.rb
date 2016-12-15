class ShoesController < ApplicationController
  before_action :require_login

  def index
    @products = Shoe.all.includes(:user)
    @sale = Sale.all.select("sales.shoe_id").includes(:shoe)
  end
  def update

    Sale.create(user:Shoe.find(params[:id]).user,shoe: Shoe.find(params[:id]))
    Purchase.create(user:User.find(session[:user]),shoe: Shoe.find(params[:id]))
    redirect_to "/dashboards/#{current_user.id}"
  end
  def destroy
    Shoe.find(params[:id]).delete
    redirect_to "/dashboards/#{current_user.id}"
  end
end
