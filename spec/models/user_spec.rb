require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end
    context 'ユーザー新規登録ができる場合' do
      it "全ての入力が正しい場合は登録できる" do
        expect(@user).to be_valid
      end

      it "passwordが6文字以上の英数字であれば登録できる" do
        @user.password = "11111a"
        @user.password_confirmation = "11111a"
        expect(@user).to be_valid
      end
    end

    context "ユーザー新規登録ができない場合" do
      it "nicknameが空では登録出来ない" do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
  
      it "emailが空では入力できない" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
  
      it "emailは@がない場合登録できない" do
        @user.email = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
  
      it "passwordが空では入力できない" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "passwordが5文字では登録できない" do
        @user.password = "11111"
        @user.password_confirmation = "11111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが数字だけでは登録できない" do
        @user.password = "111111"
        @user.password_confirmation = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end
  
      it "passwordが英字だけでは登録できない" do
        @user.password = "abcdef"
        @user.password_confirmation = "abcdef"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end
  
      it "passwordとpassword_confirmationが不一致では登録ができない" do
        @user.password = "11111a"
        @user.password_confirmation = "11161a"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
  
      it "passwordが全角だけでは登録できない" do
        @user.password = "あかさたなは"
        @user.password_confirmation = "あかさたなは"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end
  
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
  
      it "名字が空では登録できない" do
        @user.family_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
  
      it "名字が半角では登録できない" do
        @user.family_name = "a"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name Full-width characters")
      end
  
      it "名前が空では登録できない" do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
  
      it "名前が半角では登録できない" do
        @user.first_name = "ads"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name Full-width characters")
      end
  
      it "名字カナが空では登録できない" do
        @user.kana_family_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana family name can't be blank")
      end
  
      it "名字カナが全角カナでないと登録できない" do
        @user.kana_family_name = "か"
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana family name Full-width katakana characters")
      end
  
      it "名前カナが空では登録できない" do
        @user.kana_first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first name can't be blank")
      end
  
      it "名前カナが全角カナでないと登録できない" do
        @user.kana_first_name = "か"
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first name Full-width katakana characters")
      end
  
      it "生年月日が空では登録できない" do
        @user.birth_day = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
    end
  end
end
