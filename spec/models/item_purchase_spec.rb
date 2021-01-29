require 'rails_helper'

RSpec.describe ItemPurchase, type: :model do
  describe '#create' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @item_purchase = FactoryBot.build(:item_purchase, user_id: user.id, item_id: item.id)
      sleep 0.1
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
        expect(@item_purchase.errors.full_messages).to include("クレジットカード情報を入力してください")
      end
      
      it "郵便番号がからでは商品を購入できない" do
        @item_purchase.post_code = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("郵便番号を入力してください")
      end

      it "郵便番号は桁の数字とハイフンと4桁の数字がないと商品を購入できない" do
        @item_purchase.post_code = "1111222"
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("郵便番号はハイフンを含んでください")
      end

      it "配送先の都道府県ののidが1だと商品を購入できない" do
        @item_purchase.area_id = 1
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("都道府県を選択してください")
      end

      it "市区町村が空では商品を購入できない" do
        @item_purchase.city = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("市区町村を入力してください")
      end

      it "番地が空では商品を購入できない" do
        @item_purchase.street_number = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("番地を入力してください")
      end

      it "電話番号が空では商品を購入できない" do
        @item_purchase.phone_number = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("電話番号を入力してください")
      end

      it "電話番号が10桁か11桁の半角数字以外では商品を購入できない" do
        @item_purchase.phone_number = "１１１１"
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("電話番号は半角数字を入力してください")
      end

      it "電話番号は英数混合では商品を購入できない" do
        @item_purchase.phone_number = "aaa111aaa11"
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("電話番号は半角数字を入力してください")
      end

      it "ユーザー情報が空だと商品を購入できない" do
        @item_purchase.user_id = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Userを入力してください")
      end

      it "商品の情報が空だと商品を購入できない" do
        @item_purchase.item_id = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Itemを入力してください")
      end
    end

  end
end

