class OrdersController < ApplicationController
  def index
    @order_ship = OrderShip.new
  end
end
