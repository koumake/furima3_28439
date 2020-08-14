# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...



## usersテーブル
| Column | Type | Options |
| ------ | ---- | ------- |
|firstname|string|null: false|
|lastname|string|null: false|
|firstname_alias|string|null: false|
|lastname_alias|string|null: false|
|nickname|string|null: false|
|email|string|null: false|
|birthday|date|null: false|
### Association
- has_many :items
- has_many :purchases
- has_one :address


## itemsテーブル
| Column | Type | Options |
| ------ | ---- | ------- |
|name|string|null: false|
|price|integer|null: false|
|about|text|null: false|
|category_id|integer|null: false|
|condition_id|integer|null: false|
|delivery_fee_id|integer|null: false|
|prefecture_id|integer|null: false|
|days_id|integer|null: false|
|user|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many :purchases
- has_one  :addresses

## purchasesテーブル
| Column | Type | Options |
| ------ | ---- | ------- |
|user|references|null: false, foreign_key: true|
|item|references|null: false, foreign_key: true|
### Association
- belongs_to :users
- belongs_to :items


## addressesテーブル
| Column | Type | Options |
| ------ | ---- | ------- |
|postal_code|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|house_number|string|null: false|
|building_name|string|
|tel|string|null: false|
|user|references|null: false, foreign_key: true|
### Association
- belongs_to :items
- belongs_to :users



