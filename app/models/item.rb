class Item < ApplicationRecord
  validates :name,            presence: true
  validates :content,         presence: true
  validates :category_id,     presence: true
  validates :condition_id,    presence: true
  validates :shipping_fee_id, presence: true
  validates :prefecture_id,   presence: true
  validates :shipping_day_id, presence: true
  validates :item_price,      presence: true

  belongs_to :user

  has_one_attached :image
end

