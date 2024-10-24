class OrderShip
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :street, :building, :phone_number, :token

  with_options presence: true do
    # Orderモデルのバリデーション
    validates :user_id
    validates :item_id

    # Shipモデルのバリデーション
    validates :post_code,       format: { with: /\A\d{3}[-]\d{4}\z/ , message: "is invalid. Enter it as follows (e.g. 123-4567)"}
    validates :prefecture_id,   numericality: { other_than: 1 , message: "can't be blank"}
    validates :city
    validates :street
    validates :phone_number,    format: { with: /\A\d{10,11}\z/ , message: "is invalid. Input only number"}

    # トークンのバリデーション
    validates :token
  end

  # 保存処理
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Ship.create(post_code: post_code, prefecture_id: prefecture_id, city: city, street: street, building: building, phone_number: phone_number, order_id: order.id)

  end
end