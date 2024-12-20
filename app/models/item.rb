class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :content
    validates :category_id,     numericality: { other_than: 1, message: 'を選択してください' }
    validates :condition_id,    numericality: { other_than: 1, message: 'を選択してください' }
    validates :shipping_fee_id, numericality: { other_than: 1, message: 'を選択してください' }
    validates :prefecture_id,   numericality: { other_than: 1, message: 'を選択してください' }
    validates :shipping_day_id, numericality: { other_than: 1, message: 'を選択してください' }
    validates :item_price,      numericality: { in: 300..9_999_999, only_integer: true }
    validates :image
  end

  belongs_to :user
  has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :shipping_day
end
