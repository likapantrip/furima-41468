class OrderShip
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :street, :building, :phone_number, :order_id

  # Orderモデルのバリデーション
  with_options presence: true do
    validates :user_id
    validates :item_id
  end

  # Shipモデルのバリデーション
  with_options presence: true do
    validates :post_code
    validates :prefecture_id,   numericality: { other_than: 1 , message: "can't be blank"}
    validates :city
    validates :street
    validates :phone_number
  end

  # 保存処理
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Ship.create(post_code: post_code, prefecture_id: prefecture_id, city: city, street: street, building: building, phone_number: phone_number, order_id: order.id)
  
  end
end