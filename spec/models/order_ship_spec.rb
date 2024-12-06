require 'rails_helper'

RSpec.describe OrderShip, type: :model do
  before do
    user = FactoryBot.create(:user)
    sleep 0.1
    item = FactoryBot.create(:item)
    sleep 0.1
    @order_ship = FactoryBot.build(:order_ship, user_id: user.id, item_id: item.id)
  end

  describe '注文情報の保存' do
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_ship).to be_valid
      end
      it 'buildingがNULLでも保存できること' do
        building = ''
        expect(@order_ship).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'userがNULLだと保存できないこと' do
        @order_ship.user_id = nil
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include('Userを入力してください')
      end
      it 'itemがNULLだと保存できないこと' do
        @order_ship.item_id = nil
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include('Itemを入力してください')
      end
      it 'post_codeがNULLだと保存できないこと' do
        @order_ship.post_code = ''
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include('郵便番号を入力してください')
      end
      it 'prefecture_idがNULLだと保存できないこと' do
        @order_ship.prefecture_id = ''
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include('都道府県を入力してください')
      end
      it 'cityがNULLだと保存できないこと' do
        @order_ship.city = ''
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include('市区町村を入力してください')
      end
      it 'streetがNULLだと保存できないこと' do
        @order_ship.street = ''
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include('番地を入力してください')
      end
      it 'phone_numberがNULLだと保存できないこと' do
        @order_ship.phone_number = ''
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include('電話番号を入力してください')
      end
      it 'tokenがNULLだと保存できないこと' do
        @order_ship.token = nil
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include('クレジットカード情報を入力してください')
      end

      it 'post_codeが123-4567形式でないと保存できないこと' do
        @order_ship.post_code = '1234567'
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include('郵便番号は不正な値です。右記のように記載ください (例: 123-4567)')
      end

      it 'prefecture_idが英文字だと保存できないこと' do
        @order_ship.prefecture_id = 'a'
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include('都道府県を選択してください')
      end
      it 'prefecture_idが全角数字だと保存できないこと' do
        @order_ship.prefecture_id = '２'
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include('都道府県を選択してください')
      end
      it 'prefecture_idが「1」だと保存できないこと' do
        @order_ship.prefecture_id = 1
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include('都道府県を選択してください')
      end

      it 'phone_numberが10桁未満だと保存できないこと' do
        @order_ship.phone_number = '012345678'
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include('電話番号は不正な値です。数値のみを入力ください')
      end
      it 'phone_numberが11桁より多いと保存できないこと' do
        @order_ship.phone_number = '090123456789'
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include('電話番号は不正な値です。数値のみを入力ください')
      end
      it 'phone_numberが全角数字と保存できないこと' do
        @order_ship.phone_number = '０９０１２３４５６７８'
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include('電話番号は不正な値です。数値のみを入力ください')
      end
    end
  end
end
