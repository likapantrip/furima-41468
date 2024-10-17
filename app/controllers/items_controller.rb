class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new()
  end

  def create
    @item = Item.new(set_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_params
    params.require(:item).permit(:image, :name, :content, :category_id, :condition_id, :shipping_fee_id, :prefecture_id, :shipping_day_id, :item_price).merge(user_id: current_user.id)
  end
end
