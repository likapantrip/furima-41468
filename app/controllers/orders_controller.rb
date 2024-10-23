class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_root_user
  before_action :move_to_root_soldout
  before_action :get_item, only: :index

  def index
    @order_ship = OrderShip.new
  end

  def create
    @order_ship = OrderShip.new(set_params)
    if @order_ship.valid?
      @order_ship.save
      redirect_to root_path
    else
      get_item
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_params
    params.require(:order_ship).permit(:post_code, :prefecture_id, :city, :street, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id].to_i)
  end

  def get_item
    @item = Item.find(params[:item_id])
  end

  def move_to_root_user
    get_item
    if user_signed_in? && @item.user.id == current_user.id
      redirect_to root_path
    end
  end

  def move_to_root_soldout
    get_item
    if user_signed_in? && Order.exists?(id: @item.id)
      redirect_to root_path
    end
  end

end
