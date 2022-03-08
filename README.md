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
| birthday           | date   | null: false |

### Association

* has_many :items
* has_many :records

## items テーブル

| Column               | Type       | Options     |
| --------------       | ---------  | ----------- |
| name                 | string     | null: false |
| explanation          | text       | null: false |
| detail_category_id   | integer    | null: false |
| detail_status_id     | integer    | null: false |
| delivery_id          | integer    | null: false |
| delivery_area_id     | integer    | null: false |
| delivery_day_id      | integer    | null: false |
| price                | integer    | null: false |
| user                 | references | null: false,foreign_key:true |

### Association

- belongs_to :user
- has_one :record

## records テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column                  | Type         | Options     |
| ------------------      | ------       | ----------- |
| post_code               | string       | null: false |
| delivery_area_id        | integer      | null: false |
| delivery_city           | string       | null: false |
| delivery_number         | string       | null: false |
| building_name           | string       |             |
| phone_number            | string       | null: false |
| record                  | references   | null: false, foreign_key: true |

### Association

- belongs_to :record