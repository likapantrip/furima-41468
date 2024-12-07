class CardsController < ApplicationController
  def new
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @card = Card.new
  end

  def create
    # 環境変数を読み込む
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    customer = Payjp::Customer.create(
      description: 'test', # テストカードであることを説明
      card: params[:token] # 登録しようとしているカード情報
    )

    # 顧客トークンとログインしているユーザーを紐付けるインスタンスを生成
    @card = Card.new(
      token: params[:token], # カード情報
      customer_token: customer.id, # 顧客トークン
      user_id: current_user.id # ログインしているユーザー
    )

    if @card.save
      count = Card.where(user_id: current_user.id).count - 1
      count.times do |c|
        card_old = Card.find_by(user_id: current_user.id)
        card_old.destroy
      end
      redirect_to root_path
    else
      flash[:alert] = 'クレジットカード情報を入力してください'
      redirect_to action: 'new'
    end
  end
end
