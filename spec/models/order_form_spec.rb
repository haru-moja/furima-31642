require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    @order = FactoryBot.build(:order_form)
  end

  describe '購入者情報登録' do
    it '必要項目を入力し、購入者情報登録ができる' do
      expect(@order).to be_valid
    end
    it 'postal_codeが空だと登録できないこと' do
      @order.postal_code = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeに（-）ハイフンが無いと登録できないこと' do
      @order.postal_code = "1234567"
      @order.valid?
      expect(@order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end
    it 'prefecture_idが空だと登録できないこと' do
      @order.prefecture_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'municipalityが空だと登録できないこと' do
      @order.municipality = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Municipality can't be blank")
    end
    it 'addressが空だと登録できないこと' do
      @order.address = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Address can't be blank")
    end
    it 'building_nameは空でも登録できる' do
      @order.building_name = nil
      expect(@order).to be_valid
    end
    it 'phone_numberが空だと登録できないこと' do
      @order.phone_number = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_number11桁以内で無いと登録できないこと' do
      @order.phone_number = 123456789098
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number is invalid")
    end
    it 'tokenが空だと登録できないこと' do
      @order.token = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Token can't be blank")
    end
    it 'item_idが空だと登録できないこと' do
      @order.item_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Item can't be blank")
    end
    it 'user_idが空だと登録できないこと' do
      @order.user_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("User can't be blank")
    end
    it 'purchase_idが空だと登録できないこと' do
      @order.purchase_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Purchase can't be blank")
    end
  end
end
