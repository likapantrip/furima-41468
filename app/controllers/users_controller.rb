class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @items = Item.where(user_id: params[:id]).order('created_at DESC')

    Payjp.api_key = ENV['PAYJP_SECRET_KEY'] # 環境変数を読み込む
    @user_card = Card.find_by(user_id: current_user)

    return if @user_card.nil?

    customer = Payjp::Customer.retrieve(@user_card.customer_token) # カード情報を元に、顧客情報を取得
    @card = customer.cards.first
  end
end
