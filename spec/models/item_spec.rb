require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '新規商品出品' do
    context '新規商品を出品できるとき' do
      it '全項目存在すれば出品できる' do
        expect(@item).to be_valid
      end
    end
    context '新規商品を出品できないとき' do
      it 'nameがnullだと出品できない' do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'contentがnullだと出品できない' do
        @item.content = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Content can't be blank")
      end
      it 'category_idがnullだと出品できない' do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'condition_idがnullだと出品できない' do
        @item.condition_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it 'shipping_fee_idがnullだと出品できない' do
        @item.shipping_fee_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
      end
      it 'prefecture_idがnullだと出品できない' do
        @item.prefecture_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'shipping_day_idがnullだと出品できない' do
        @item.shipping_day_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end
      it 'item_priceがnullだと出品できない' do
        @item.item_price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price can't be blank")
      end
      it 'userがnullだと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
      it 'imageがnullだと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'category_idが英文字だと出品できない' do
        @item.category_id = "a"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'category_idが全角数字だと出品できない' do
        @item.category_id = "２"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'category_idが「1」だと出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'condition_idが英文字だと出品できない' do
        @item.condition_id = "a"
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it 'condition_idが全角数字だと出品できない' do
        @item.condition_id = "２"
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it 'condition_idが「1」だと出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it 'shipping_fee_idが英文字だと出品できない' do
        @item.shipping_fee_id = "a"
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
      end
      it 'shipping_fee_idが全角数字だと出品できない' do
        @item.shipping_fee_id = "２"
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
      end
      it 'shipping_fee_idが「1」だと出品できない' do
        @item.shipping_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
      end

      it 'prefecture_idが英文字だと出品できない' do
        @item.prefecture_id = "a"
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idが全角数字だと出品できない' do
        @item.prefecture_id = "２"
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idが「1」だと出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'shipping_day_idが英文字だと出品できない' do
        @item.shipping_day_id = "a"
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end
      it 'shipping_day_idが全角数字だと出品できない' do
        @item.shipping_day_id = "２"
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end
      it 'shipping_day_idが「1」だと出品できない' do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end

      it 'item_priceが英文字だと出品できない' do
        @item.item_price = "one"
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price is not a number")
      end
      it 'item_priceが全角数字だと出品できない' do
        @item.item_price = "３００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price is not a number")
      end
      it 'item_priceが英数字混同(先頭が文字)だと出品できない' do
        @item.item_price = "one000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price is not a number")
      end
      it 'item_priceが英数字混同(末尾が文字)だと出品できない' do
        @item.item_price = "100one"
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price is not a number")
      end
      it 'item_priceが「299」だと出品できない' do
        @item.item_price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price must be in 300..9999999")
      end
      it 'item_priceが「10000000」だと出品できない' do
        @item.item_price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price must be in 300..9999999")
      end
      
    end
  end
end
