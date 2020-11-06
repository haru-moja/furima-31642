## usersテーブル
| Column | Type | Options |
|---|---|---|
|nickname|string|null: false|
|email|string|null: false|
|password|string|null: false|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name(kana)|string|null: false|
|first_name(kana)|string|null: false|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|integer|null: false|
### Association
- has_many :purchases
- has_many :items
<br>
<br>
## itemsテーブル
| Column | Type | Options |
|---|---|---|
|item_image|string|null: false|
|item_name|string|null: false|
|description|text|null: false|
|category|integer|null: false|
|status|integer|null: false|
|shipping_cost|integer|null: false|
|shipment_source|integer|null: false|
|days_to_ship|integer|null: false|
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
- belongs_to :item
- has_one :address
<br>
<br>
## addressesテーブル
| Column | Type | Options |
|---|---|---|
|postal_code|string|null: false|
|prefectures|integer|null: false|
|address|string|null: false|
|building_name|string|null: false|
|phone_number|integer|null: false|
|purchase|references|null: false, foreign_key: true|
### Association
- belongs_to :purchase
<br>
<br>

