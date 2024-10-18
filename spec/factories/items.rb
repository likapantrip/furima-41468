FactoryBot.define do
  factory :item do
    name                  {'スーツ'}
    content               {'メンズスーツ'}
    category_id           {'2'}
    condition_id          {'2'}
    shipping_fee_id       {'2'}
    prefecture_id         {'2'}
    shipping_day_id       {'2'}
    item_price            {'300'}

    association :user
    after(:build) do |m|
      m.image.attach(io: File.open('public/images/test1.jpg'), filename: 'test1.jpg')
    end
  end
end