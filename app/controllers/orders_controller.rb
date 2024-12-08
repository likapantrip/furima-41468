class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :get_item
  before_action :move_to_root_user
  before_action :move_to_root_soldout

  def index
    redirect_to new_card_path and return unless current_user.card.present?

    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @order_ship = OrderShip.new
  end

  def create
    @order_ship = OrderShip.new(set_params)
    if @order_ship.valid?
      pay_item
      @order_ship.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_params
    params.require(:order_ship).permit(:post_code, :prefecture_id, :city, :street, :building, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id].to_i
    )
  end

  def get_item
    @item = Item.find(params[:item_id])
  end

  def move_to_root_user
    return unless @item.user.id == current_user.id

    redirect_to root_path
  end

  def move_to_root_soldout
    return unless Order.exists?(item_id: @item.id)

    redirect_to root_path
  end

  def pay_item
    item = Item.find(@order_ship.item_id)
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    customer_token = current_user.card.customer_token # ログインしているユーザーの顧客トークンを定義
    Payjp::Charge.create(
      amount: item.item_price,
      customer: customer_token,
      currency: 'jpy'
    )
  end
end
