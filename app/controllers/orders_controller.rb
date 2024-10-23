class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_root_user
  before_action :move_to_root_soldout
  before_action :get_item, only: :index

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_ship = OrderShip.new
  end

  def create
    @order_ship = OrderShip.new(set_params)
    if @order_ship.valid?
      pay_item
      @order_ship.save
      redirect_to root_path
    else
      get_item
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_params
    params.require(:order_ship).permit(:post_code, :prefecture_id, :city, :street, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id].to_i, token: params[:token])
  end

  def get_item
    @item = Item.find(params[:item_id])
  end

  def move_to_root_user
    get_item
    if @item.user.id == current_user.id
      redirect_to root_path
    end
  end

  def move_to_root_soldout
    get_item
    if Order.exists?(item_id: @item.id)
      redirect_to root_path
    end
  end

  def pay_item
    item = Item.find(@order_ship.item_id)
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: item.item_price,
      card: set_params[:token],
      currency: 'jpy'
    )
  end

end
