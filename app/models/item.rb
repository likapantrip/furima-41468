class Item < ApplicationRecord
  validates :name,            presence: true
  validates :content,         presence: true
  validates :category_id,     presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id,    presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_fee_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id,   presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_day_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :item_price,      presence: true, format: { with: /\A\d+\z/ }, numericality: { in: 300..9999999}
  validates :image,           presence: true
  
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :shipping_day
end

