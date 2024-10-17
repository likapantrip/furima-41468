FactoryBot.define do
  factory :user do
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 6)+'1a'}
    password_confirmation {password}
    nickname              {Faker::Internet.username}
    last_name             {"田中"}
    first_name            {"太郎"}
    last_name_kana        {"タナカ"}
    first_name_kana       {"タロウ"}
    birthday              {Faker::Date.between(from: '1930-01-01', to: 5.years.ago)}

  end
end
