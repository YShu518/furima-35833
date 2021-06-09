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
- has_many :buyers

## Itemテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| name          | string     | null: false                    |
| description   | text       | null: false                    |
| category      | string     | null: false                    |
| used          | string     | null: false                    |
| price         | int        | null: false                    |
| area          | string     | null: false                    |
| shipping_cost | int        | null: false                    |
| takes_days    | string     | null :false                    |
| user_id       | references | null: false, foreign_key: true |

### Association

- has_many :comments
- belongs_to :user
- has_one :buyer

## Commentテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| comment | text       | null: false                    |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user

## Buyerテーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| postal_code          | int        | null: false                    |
| region               | string     | null: false                    |
| city                 | string     | null: false                    |
| address_line1        | string     | null: false                    |
| address_line2        | string     |                                |
| phone_number         | int        | null: false                    |
| user_id              | references | null: false, foreign_key: true |
| item_id              | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
