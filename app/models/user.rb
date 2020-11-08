class User < ApplicationRecord
  # Include default devise modules. Others available are: 
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,}+\z/i
  # VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/
  # VALID_NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/


  # validates :encrypted_password, length: { minimum: 6 },
  #            format: { with: VALID_PASSWORD_REGEX, message: 'は6文字以上入力してください。' }
  # validates :first_name, format: {with: VALID_NAME_REGEX, message: 'はひらがな、カタカナ、漢字で入力してください。' } 
  # validates :last_name, format: { with: VALID_NAME_REGEX, message: 'はひらがな、カタカナ、漢字で入力して下さい。' }
  # validates :first_name_kana, format: { with: VALID_NAME_KANA_REGEX, message: 'はカタカナで入力して下さい。' }
  # validates :last_name_kana, format: { with: VALID_NAME_KANA_REGEX, message: 'はカタカナで入力して下さい。' }




end
