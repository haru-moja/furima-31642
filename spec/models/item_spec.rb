require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品登録機能'
  it '必要項目を入力し、商品登録ができる' do
    expect(@item).to be_valid

  end
  it 'item_nameが空だと登録できない' do
    @item.item_name = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Item name can't be blank")
  end
  it 'descriptionが空だと登録できない' do
    @item.description = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Description can't be blank")
  end
  it 'category_idが空だと登録できない' do
    @item.category_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Category can't be blank")
  end
  it 'status_idが空だと登録できない' do
    @item.status_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Status can't be blank")
  end
  it 'shipping_cost_idが空だと登録できない' do
    @item.shipping_cost_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Shipping cost can't be blank")
  end
  it 'prefectures_idが空だと登録できない' do
    @item.prefectures_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Prefectures can't be blank")
  end
  it 'days_to_ship_idが空だと登録できない' do
    @item.days_to_ship_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Days to ship can't be blank")
  end
  it 'priceが空だと登録できない' do
    @item.price = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Price can't be blank")
  end
  it 'priceの値が300~9,999,999でないと登録できない' do
    @item.price = 200
    @item.valid?
    expect(@item.errors.full_messages).to include("Price 入力値が¥300~¥9,999,999の範囲外です")
  end

  it 'imageが空だと登録できない' do
    @item.image = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Image ファイルを添付してください")
  end
end
