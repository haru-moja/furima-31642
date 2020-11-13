class OrderForm
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :token,
                :item_id, :user_id, :purchase_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipality
    validates :address
    validates :token
    validates :item_id
    validates :user_id
    validates :purchase_id
    validates :phone_number, format: { with: /\A[0-9]{,11}\z/ }
  end
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Address.create(
      postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality,
      address: address, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id
    )
  end
end
