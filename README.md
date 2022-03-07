# # テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique:true |
| encrypted_password | string | null: false |
| last_name_zen      | string | null: false |
| first_name_zen     | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birthday           | string | null: false |

### Association

* has_many :items
* belongs_to :record

## items テーブル

| Column             | Type      | Options     |
| --------------     | --------- | ----------- |
| name               | string    | null: false |
| explanation        | text      | null: false |
| detail_category    | string    | null: false |
| detail_status      | string    | null: false |
| delivery           | string    | null: false |
| delivery_area      | string    | null: false |
| delivery_days      | string    | null: false |
| price              | integer   | null: false |
| user               | reference | null: false,foreign_key:true |

### Association

- belongs_to :users
- belongs_to :record

## record テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items
- belongs_to :address

## address テーブル

| Column             | Type         | Options     |
| ------------------ | ------       | ----------- |
| post_code          | string       | null: false |
| delivery_area      | string       | null: false |
| delivery_city      | string       | null: false |
| building_name      | string       | null: false |
| phone_number       | integer      | null: false |
| record             | references   | null: false, foreign_key: true |

### Association

- belongs_to :record