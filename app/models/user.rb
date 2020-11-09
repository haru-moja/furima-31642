class User < ApplicationRecord
  # Include default devise modules. Others available are: 
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,}+\z/i
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/
  VALID_NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/

  validates :nickname, presence: true
  validates :password, length: { minimum: 6 ,message: 'は6文字以上入力してください。'},
             format: { with: VALID_PASSWORD_REGEX }
  validates :first_name, presence: true, format: {with: VALID_NAME_REGEX, message: 'はひらがな、カタカナ、漢字で入力してください。' } 
  validates :last_name, presence: true, format: {with: VALID_NAME_REGEX, message: 'はひらがな、カタカナ、漢字で入力してください。' }
  validates :first_name_kana, presence: true, format: { with: VALID_NAME_KANA_REGEX, message: 'はカタカナで入力して下さい。' }
  validates :last_name_kana, presence: true, format: { with: VALID_NAME_KANA_REGEX, message: 'はカタカナで入力して下さい。' }
  validates :birth_day, presence: true




end
