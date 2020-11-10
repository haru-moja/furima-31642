class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  has_one_attached :image
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :days_to_ship
  belongs_to :user

  validate :image_presence

  def image_presence
    if image.attached?
      if !image.content_type.in?(%('image/jpeg image/png'))
        errors.add(:image, 'にはjpegまたはpngファイルを添付してください')
      end
    else
      errors.add(:image, 'ファイルを添付してください')
    end
  end
  
  with_options presence: true do
    validates :item_name
    validates :description
    validates :category_id
    validates :status_id
    validates :shipping_cost_id
    validates :prefectures_id
    validates :days_to_ship_id
    validates :price,   numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: '入力値が¥300~¥9,999,999の範囲外です'},
                format: { with: /\A[0-9]+\z/,
                 message: "半角数字のみが使用できます" }
  end
end
