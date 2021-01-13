# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| family_name        | string  | null: false |
| first_name         | string  | null: false |
| kana_family_name   | string  | null: false |
| kana_first_name    | string  | null: false |
| birth_day          | date    | null: false |

### Association
- has_many :items
- has-one :card

# items テーブル

| Column          | Type       | Options                         |
| --------------- | ---------- | ------------------------------- |
| name            | string     | null: false                     |
| explanation     | text       | null: false                     |
| category_id     | integer    | null: false                     | 
| state_id        | integer    | null: false                     |
| delivery_fee_id | integer    | null: false                     |
| area_id         | integer    | null: false                     |
| days_id         | integer    | null: false                     |
| price           | integer    | null: false                     |
| user            | references | null: false, foreign_key: true  |

### Association

- belongs_to :user

## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_code     | string     | null: false                    |
| prefectures   | integer    | null: false                    |
| city          | string     | null: false                    |
| street_number | string     | null: false                    |
| buildings     | string     |                                |
| phone_number  | string     | null: false                    |
| card          | references | null: false, foreign_key: true |

### Association

- belongs_to :card

## cards テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| customer_id   | string     | null: false                    |
| card_id       | string     | null: false                    |
| user          | references | null: false, foreign_key: true |

- belongs_to :user
- has-one :address