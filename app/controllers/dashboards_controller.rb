class DashboardsController < ApplicationController
  before_action :require_login
  before_action :require_correct_user
  def show
    @products = Shoe.where(user:User.find(session[:user])).includes(:user)
    @sale = Sale.all.select("sales.shoe_id")
    @purchases = Purchase.where(user_id:User.find(session[:user])).includes(:shoe).includes(:user)
    @totalsale = Sale.where(user:User.find(session[:user])).includes(:shoe).includes(:user)
    @saletotal =Sale.where(user:User.find(session[:user])).includes(:shoe).sum(:price)
    @purchasetotal =Purchase.where(user_id:User.find(session[:user])).includes(:shoe).includes(:user).sum(:price)
  end
  def create
    product = Shoe.new(product_params.merge(user:User.find(session[:user])))
    flash[:product] = product.errors.full_messages unless product.save
    redirect_to "/dashboards/#{current_user.id}"

  end
  private
    def product_params
      params.require(:product).permit(:name, :price)
    end
end
