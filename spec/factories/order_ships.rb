FactoryBot.define do
  factory :order_ship do
    post_code      { '123-4567' }
    prefecture_id  { 2 }
    city           { '東京都' }
    street         { '1-1' }
    building       { '東京ハイツ' }
    phone_number   { '09012345678' }
    token          {"tok_abcdefghijk00000000000000000"}
  end
end