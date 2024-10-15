## usersテーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| email                 | string     | null: false, unique: true      |
| password              | string     | null: false                    |
| password_confirmation | string     | null: false                    |
| nickname              | string     | null: false                    |
| last_name             | string     | null: false                    |
| first_name            | string     | null: false                    |
| last_name_kana        | string     | null: false                    |
| first_name_kana       | string     | null: false                    |
| birthday_year         | integer    | null: false                    |
| birthday_month        | integer    | null: false                    |
| birthday_day          | integer    | null: false                    |

### Association
- has_many :items
- has_many :orders

## itemsテーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| name                  | string     | null: false                    |
| content               | text       | null: false                    |
| category              | string     | null: false                    |
| condition             | string     | null: false                    |
| shipping_fee          | integer    | null: false                    |
| shipping_area         | string     | null: false                    |
| shipping_day          | integer    | null: false                    |
| item_price            | integer    | null: false                    |
| status                | string     | null: false                    |
| user                  | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :order

## ordersテーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| card_number           | integer    | null: false                    |
| card_limit            | integer    | null: false                    |
| card_security         | integer    | null: false                    |
| shipping_postcode     | integer    | null: false                    |
| shipping_prefecture   | string     | null: false                    |
| shipping_city         | string     | null: false                    |
| shipping_street       | string     | null: false                    |
| shipping_building     | string     |                                |
| shipping_phone        | integer    | null: false                    |
| user                  | references | null: false, foreign_key: true |
| item                  | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
