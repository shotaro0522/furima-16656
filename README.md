## usersテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| nickname  | string | null: false|
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| last_name              | string | null: false |
| first_name              | string | null: false |
| last_name_kana              | string | null: false |
| first_name_kana              | string | null: false |
| birthday              | date | null: false |

### Association
- has_many :items
- has_many :orders


## itemsテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| name  | string | null: false|
| info  | text | null: false|
| category  | string | null: false |
| state  | string | null: false|
| delivery_charge  | string | null: false|
| delivery_region  | string | null: false|
| price| integer | null: false |



### Association
- belongs_to :user
- has_one :order



## ordersテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item  | references | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user
- has_one :address


## addressesテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| order   | references | null: false, foreign_key: true |
| post_code  | string | null: false|
| prefecture  | string | null: false|
| city  | string | null: false|
| block_number  | string | null: false|
| house_name  | string | |
| phone_number  | string | null: false|

### Association
- belongs_to :order