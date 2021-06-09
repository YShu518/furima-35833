# テーブル設計

## Userテーブル

| Column              | Type   | Options                   |
| ------------------- | ------ | ------------------------- |
| nickname            | string | null: false               |
| email               | string | null: false               |
| encrypted_password  | string | null: false, unique: true |
| birthday            | date   | null: false               |
| first_name          | string | null: false               |
| last_name           | string | null: false               |
| first_name_katakana | string | null: false               |
| last_name_katakana  | string | null: false               |

### Association

- has_many :items
- has_many :comments
- has_many :purchase_history

## Itemテーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| name             | string     | null: false |
| description      | text       | null: false |
| category_id      | int        | null: false |
| used_id          | int        | null: false |
| price            | int        | null: false |
| area_id          | int        | null: false |
| shipping_cost_id | int        | null: false |
| takes_day_id     | int        | null :false |

### Association

- has_many :comments
- belongs_to :user
- has_one :shipping_address
- has_one :purchase_history

## Commentテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| comment | text       | null: false                    |

### Association

- belongs_to :item
- belongs_to :user

## ShippingAddressテーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| postal_code          | string     | null: false                    |
| region               | string     | null: false                    |
| city                 | string     | null: false                    |
| address_line1        | string     | null: false                    |
| address_line2        | string     |                                |
| phone_number         | string     | null: false                    |

### Association

- belongs_to :item

## PurchaseHistory

### Association

- belongs_to :user
- belongs_to :item

