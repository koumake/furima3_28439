require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/image/test_image.png')
    end

    context "登録できること" do
    
    it "name,image,price,about,genre_id,condition_id,delivery_fee_id,prefecture_id,days_idの値が存在すれば登録できること" do
      expect(@item).to be_valid
    end
    it "priceが300〜9999999なら登録できること" do
      @item.price = 500
      expect(@item).to be_valid
    end

    end 
    
   context "登録できないこと" do
   
    it "imageが空では登録できないこと" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it "nameが空では登録できないこと" do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it "priceが空では登録できないこと" do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank", "Price is not a number")
    end

    it "aboutが空では登録できないこと" do
      @item.about = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("About can't be blank")
    end

    it "genre_idが空では登録できないこと" do
      @item.genre_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Genre is not a number", "Genre can't be blank")
    end

    it "condition_idが空では登録できないこと" do
      @item.condition_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition is not a number", "Condition can't be blank")
    end

    it "delivery_fee_idが空では登録できないこと" do
      @item.delivery_fee_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery fee is not a number", "Delivery fee can't be blank")
    end
    it "prefecture_idが空では登録できないこと" do
      @item.prefecture_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture is not a number", "Prefecture can't be blank")
    end
    it "day_idが空では登録できないこと" do
      @item.day_id = nil 
      @item.valid?
      expect(@item.errors.full_messages).to include("Day is not a number", "Day can't be blank")
    end
    it "priceが299だと登録できないこと" do
       @item.price = 299
       @item.valid?
       expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end
    it "priceが10000000だと登録できないこと" do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end

    it "genre_idが1だと登録できないこと" do
      @item.genre_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include( "Genre must be other than 1")
    end
    it "condition_idが1だと登録できないこと" do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition must be other than 1")
    end
    it "delivery_fee_idが1だと登録できないこと" do
      @item.delivery_fee_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery fee must be other than 1")
    end
    it "prefecture_idが1だと登録できないこと" do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
    end
    it "day_idが1だと登録できないこと" do
      @item.day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Day must be other than 1")
    end

    end
  end
end
