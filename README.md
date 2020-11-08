 ## usersテーブル
| Column | Type | Options |
|---|---|---|
|nickname|string|null: false|
|email|string|null: false|
|encrypted_password|string|null: false|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birth_day|date|null: false|
### Association
- has_many :purchases
- has_many :items
<br>
<br>

## itemsテーブル
| Column | Type | Options |
|---|---|---|
|item_name|string|null: false|
|description|text|null: false|
|category_id|integer|null: false|
|status_id|integer|null: false|
|shipping_cost_id|integer|null: false|
|prefectures_id|integer|null: false|
|days_to_ship_id|integer|null: false|
|price|integer|null: false|
|user|references|null: false, foreign_key: true|
### Association
- has_one :purchase
- belongs_to :user
<br>
<br>

## purchasesテーブル
| Column | Type | Options |
|---|---|---|
|user|references|null: false, foreign_key: true|
|item|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :item
- has_one :address
<br>
<br>

## addressesテーブル
| Column | Type | Options |
|---|---|---|
|postal_code|string|null: false|
|prefectures_id|integer|null: false|
|municipality|string|null: false|
|address|string|null: false|
|building_name|string||
|phone_number|string|null: false|
|purchase|references|null: false, foreign_key: true|
### Association
- belongs_to :purchase
<br>
<br>

