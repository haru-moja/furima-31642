require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it "nicknameが空だと登録できない" do
    end
    it "emailが空だと登録できない" do
    end
    it "同じemailだと登録できない" do
    end
    it "emailに＠がなければ登録できない" do
    end
    it "passwordが空だと登録できない" do
    end
    it "passwordは半角英数字混合でなければ登録できない" do
    end
    it "passwordが確認用passwordと同一でなければ登録できない" do
    end
    it "first_nameが空だと登録できない" do
    end
    it "first_nameは全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
    end
    it "last_nameが空だと登録できない" do
    end
    it "last_nameは全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
    end
    it "first_name_kanaが空だと登録できない" do
    end
    it "first_name_kanaは全角（カタカナ）でなければ登録できない" do
    end
    it "last_name_kanaが空だと登録できない" do
    end
    it "last_name_kanaは全角（カタカナ）でなければ登録できない" do
    end
    it "birth_dayが空だと登録できない" do
    end
  end
end
