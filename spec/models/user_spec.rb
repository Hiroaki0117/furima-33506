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
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
  
      it "emailが空では入力できない" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
  
      it "emailは@がない場合登録できない" do
        @user.email = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end
  
      it "passwordが空では入力できない" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end

      it "passwordが5文字では登録できない" do
        @user.password = "11111"
        @user.password_confirmation = "11111"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it "passwordが数字だけでは登録できない" do
        @user.password = "111111"
        @user.password_confirmation = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは英数字混合にしてください")
      end
  
      it "passwordが英字だけでは登録できない" do
        @user.password = "abcdef"
        @user.password_confirmation = "abcdef"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは英数字混合にしてください")
      end
  
      it "passwordとpassword_confirmationが不一致では登録ができない" do
        @user.password = "11111a"
        @user.password_confirmation = "11161a"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
  
      it "passwordが全角だけでは登録できない" do
        @user.password = "あかさたなは"
        @user.password_confirmation = "あかさたなは"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは英数字混合にしてください")
      end
  
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
  
      it "名字が空では登録できない" do
        @user.family_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("名字を入力してください")
      end
  
      it "名字が半角では登録できない" do
        @user.family_name = "a"
        @user.valid?
        expect(@user.errors.full_messages).to include("名字は全角文字で入力してください")
      end
  
      it "名前が空では登録できない" do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end
  
      it "名前が半角では登録できない" do
        @user.first_name = "ads"
        @user.valid?
        expect(@user.errors.full_messages).to include("名前は全角文字で入力してください")
      end
  
      it "名字カナが空では登録できない" do
        @user.kana_family_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("カナ名字を入力してください")
      end
  
      it "名字カナが全角カナでないと登録できない" do
        @user.kana_family_name = "か"
        @user.valid?
        expect(@user.errors.full_messages).to include("カナ名字は全角カナ文字で入力してください")
      end
  
      it "名前カナが空では登録できない" do
        @user.kana_first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("カナ名前を入力してください")
      end
  
      it "名前カナが全角カナでないと登録できない" do
        @user.kana_first_name = "か"
        @user.valid?
        expect(@user.errors.full_messages).to include("カナ名前は全角カナ文字で入力してください")
      end
  
      it "生年月日が空では登録できない" do
        @user.birth_day = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("誕生日を入力してください")
      end
    end
  end
end
