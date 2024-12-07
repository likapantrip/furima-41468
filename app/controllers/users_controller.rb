class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])

    Payjp.api_key = ENV['PAYJP_SECRET_KEY'] # 環境変数を読み込む
    card = Card.find_by(user_id: current_user) # ユーザーのid情報を元に、カード情報を取得
    customer = Payjp::Customer.retrieve(card.customer_token) # カード情報を元に、顧客情報を取得
    @card = customer.cards.first
  end
end
