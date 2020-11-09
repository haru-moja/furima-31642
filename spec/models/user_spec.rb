require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it '必要項目を入力し、ユーザー登録ができる' do
      expect(@user).to be_valid
    end
    it 'nicknameが空だと登録できない' do
      @user.nickname = nil
      @user.valid?
    end
    it 'emailが空だと登録できない' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it '同じemailだと登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'emailに＠がなければ登録できない' do
      @user.email = 'aaaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'passwordが空だと登録できない' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'encrypted_passwordは半角英数字混合でなければ登録できない' do
      @user.password = 'アイウエオ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
    it 'encrypted_passwordが確認用passwordと同一でなければ登録できない' do
      @user.password_confirmation = '111aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'first_nameが空だと登録できない' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'first_nameは全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
      @user.first_name = 'abcdefgh'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name はひらがな、カタカナ、漢字で入力してください。')
    end
    it 'last_nameが空だと登録できない' do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'last_nameは全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
      @user.last_name = 'abcdefgh'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name はひらがな、カタカナ、漢字で入力してください。')
    end
    it 'first_name_kanaが空だと登録できない' do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it 'first_name_kanaは全角（カタカナ）でなければ登録できない' do
      @user.first_name_kana = 'abcdefgh'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana はカタカナで入力して下さい。')
    end
    it 'last_name_kanaが空だと登録できない' do
      @user.last_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it 'last_name_kanaは全角（カタカナ）でなければ登録できない' do
      @user.last_name_kana = 'abcdefgh'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana はカタカナで入力して下さい。')
    end
    it 'birth_dayが空だと登録できない' do
      @user.birth_day = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end
  end
end
