class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  has_one_attached :image
  has_one :purchase
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :days_to_ship
  belongs_to :user

  validate :image_presence

  def image_presence
    if image.attached?
      errors.add(:image, 'にはjpegまたはpngファイルを添付してください') unless image.content_type.in?(%('image/jpeg image/png'))
    else
      errors.add(:image, 'ファイルを添付してください')
    end
  end

  with_options presence: true do
    validates :item_name
    validates :description
    validates :price, format: { with: /\A[0-9]+\z/ },
                      numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: '入力値が¥300~¥9,999,999の範囲外です' }

    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :status_id
      validates :shipping_cost_id
      validates :prefecture_id
      validates :days_to_ship_id
    end
  end
end
