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
- has_one :order

## ordersテーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| user                  | references | null: false, foreign_key: true |
| item                  | references | null: false, foreign_key: true |
| ship                  | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :ship

## shipsテーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| post_code             | integer    | null: false                    |
| prefecture            | string     | null: false                    |
| city                  | string     | null: false                    |
| street                | string     | null: false                    |
| building              | string     |                                |
| phone_number          | integer    | null: false                    |
| order                 | references | null: false, foreign_key: true |

### Association
- belongs_to :order
