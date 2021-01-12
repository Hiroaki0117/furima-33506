# テーブル設計

## users テーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| nickname         | string  | null: false |
| email            | string  | null: false |
| password         | string  | null: false |
| family_name      | string  | null: false |
| first_name       | string  | null: false |
| kana_family_name | string  | null: false |
| kana_first_name  | string  | null: false |
| birth_day        | integer | null: false |

### Association
- has_many :items
- has-one :address
- has-one :card

# items テーブル

| Column       | Type       | Options                        |
| ------------ | ----------| ------------------------------- |
| name         | string    | null: false                     |
| explanation  | string    | null: false                     |
| category     | string    | null: false                     | 
| state        | string    | null: false                     |
| delivery_fee | string    | null: false                     |
| area         | string    | null: false                     |
| days         | string    | null: false                     |
| price        | string    | null: false                     |
| user         | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_code     | integer    | null: false                    |
| prefectures   | string     | null: false                    |
| city          | string     | null: false                    |
| street_number | string     | null: false                    |
| buildings     | string     | null: false                    |
| phone_number  | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## cards テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| customer_id   | string     | null: false                    |
| card_id       | string     | null: false                    |
| user          | references | null: false, foreign_key: true |

- belongs_to :user