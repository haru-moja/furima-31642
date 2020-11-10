class User < ApplicationRecord
  has_many :items
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/.freeze
  VALID_NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
  
  with_options presence: true do
    validates :nickname
    validates :birth_day
    
    with_options format: { with: VALID_NAME_REGEX, message: 'はひらがな、カタカナ、漢字で入力してください。' } do
      validates :first_name 
      validates :last_name
    end
    with_options format: { with: VALID_NAME_KANA_REGEX, message: 'はカタカナで入力して下さい。' } do
      validates :first_name_kana 
      validates :last_name_kana
    end
  end
  
  validates :password, length: { minimum: 6 , message: 'は6文字以上入力してください。' },
                       format: { with: VALID_PASSWORD_REGEX }
end
