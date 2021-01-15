require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end
    context '商品投稿ができる場合' do
      it "全ての入力が正しい場合は商品投稿ができる" do
        expect(@item).to be_valid
      end
    end

    context '商品投稿ができない場合' do
      it "商品画像が空では投稿できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it "商品名が空では投稿できない" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it "商品説明が空では登録できない" do
        @item.explanation = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end

      it "カテゴリーのidが1だと登録できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it "商品の状態のidが1だと登録できない" do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("State must be other than 1")
      end

      it "配送料の負担のidが1だと登録できない" do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee must be other than 1")
      end

      it "発送元の地域のidが1だと登録できない" do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Area must be other than 1")
      end

      it "発送までの日数のidが1だと登録できない" do
        @item.days_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Days must be other than 1")
      end

      it "価格が空では登録できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it "価格が300円より安いと登録できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it "価格が9999999円より高いと登録できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

      it "価格は全角文字では登録できない" do
        @item.price = "１０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it "価格は半角英数混合では登録できない" do
        @item.price = "aaaaa1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it "価格は半角英語だけでは登録できないこと" do
        @item.price = "aaaaa"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it "紐づいているユーザーがいないと登録できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end

end
