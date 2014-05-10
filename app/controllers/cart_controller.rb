class CartController < ApplicationController
  def new
    @cart = Cart.new
  end
  def index
    @cart = Cart.all
  end
  def create
    @cart = Cart.new(cart_params)
    if @cart.save
      redirect_to @cart
    else
      render 'new'
    end
  end
  def show
    @cart = Cart.find(params[:id])
  end
  def cart_params
    params.require(:cart).permit(:user, :item, :status)
  end
end
