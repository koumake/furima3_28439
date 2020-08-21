require 'rails_helper'

RSpec.describe Address, type: :model do
  describe '#create' do
    before do
      @address = FactoryBot.build(:user_purchase)
    end

    it "郵便番号、都道府県、市区町村、番地、電話番号が存在すれば登録できること" do
      expect(@address).to be_valid
    end
    it "郵便番号にハイフンがないと登録できない" do
      @address.postal_code = 1111111
      @address.valid?
      expect(@address.errors.full_messages).to include("Postal code is invalid")
    end
    it "郵便番号が空では登録できない" do
      @address.postal_code = nil
      @address.valid?
      expect(@address.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid")
    end
    it "都道府県が空では登録できない" do
      @address.prefecture = ""
      @address.valid?
      expect(@address.errors.full_messages).to include("Prefecture can't be blank")
    end
    it "市区町村が空では登録できない" do
      @address.city = nil
      @address.valid?
      expect(@address.errors.full_messages).to include("City can't be blank")
    end
    it "番地が空では登録できない" do
      @address.house_number = nil
      @address.valid?
      expect(@address.errors.full_messages).to include("House number can't be blank")
    end
    it "電話番号が空では登録できない" do
      @address.tel = nil
      @address.valid?
      expect(@address.errors.full_messages).to include("Tel can't be blank", "Tel is invalid")
    end
    it "電話番号にハイフンがあると登録できない" do
      @address.tel = 000-0000-0000
      @address.valid?
      expect(@address.errors.full_messages).to include("Tel is invalid")
    end
    it "電話番号が１２桁以上だと登録できない" do
      @address.tel = 000000000000
      @address.valid?
      expect(@address.errors.full_messages).to include("Tel is invalid")
    end
  end
end
