require 'rails_helper'

RSpec.describe ItemPurchase, type: :model do
  describe '#create' do
    before do
      @item_purchase = FactoryBot.build(:item_purchase)
    end

    context "商品が購入できる場合" do
      it "全ての情報が正しい場合は商品の購入ができる" do
        expect(@item_purchase).to be_valid
      end

      it "建物名が空でも商品を購入することができる" do
        @item_purchase.buildings = nil
        expect(@item_purchase).to be_valid
      end
    end
    context "商品が購入できない場合" do
      it "カード情報が空では商品を購入できない" do
        @item_purchase.token = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Token can't be blank")
      end
      
      it "郵便番号がからでは商品を購入できない" do
        @item_purchase.post_code = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Post code can't be blank")
      end

      it "郵便番号は桁の数字とハイフンと4桁の数字がないと商品を購入できない" do
        @item_purchase.post_code = "1111222"
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end

      it "配送先の都道府県ののidが1だと商品を購入できない" do
        @item_purchase.area_id = 1
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Area must be other than 1")
      end

      it "市区町村が空では商品を購入できない" do
        @item_purchase.city = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("City can't be blank")
      end

      it "番地が空では商品を購入できない" do
        @item_purchase.street_number = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Street number can't be blank")
      end

      it "電話番号が空では商品を購入できない" do
        @item_purchase.phone_number = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Phone number can't be blank")
      end

      it "電話番号が半角数字以外では商品を購入できない" do
        @item_purchase.phone_number = "１１１１"
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Phone number Input only number")
      end
    end

  end
end

