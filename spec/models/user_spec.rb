require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '内容に問題ない場合' do
      it '全ての情報が存在すれば登録できる' do
        expect(@user).to be_valid
      end

      it 'passwordとpassword_confirmationが6文字以上で英数字混在であれば登録できる' do
        @user.password = 'abc123'
        @user.password_confirmation = @user.password
        expect(@user).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it '重複したemailが存在すると登録できない' do
        @user.save
        user = FactoryBot.build(:user)
        user.email = @user.email
        user.valid?
        expect(user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailに「＠」がない場合、登録ができない' do
        @user.email = 'abcyahoo.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end


      it 'passwordが5文字以下だと登録できない' do
        @user.password = 'abc12'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordが英字のみでは登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
      end

      it 'passwordとpassword_confirmationが一致しないと登録できない' do
        @user.password = 'abc123'
        @user.password_confirmation = 'abv123'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordが半角数字のみの場合は登録できない' do
        @user.password = '000000'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
      end

      it 'passwordが全角の場合は登録できない' do
        @user.password = 'ｋyｐ７８９'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
      end

      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'first_nameが全角でなければ登録できない' do
        @user.first_name = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid. Input full-width characters')
      end

      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'last_nameが全角でなければ登録できない' do
        @user.last_name = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid. Input full-width characters')
      end

      it 'first_name_katakanaが空では登録できない' do
        @user.first_name_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name katakana can't be blank")
      end

      it 'first_name_katakanaが全角カタカナ以外を含むと登録できない' do
        @user.first_name_katakana = '漢字ダメ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name katakana is invalid. Input full-width katakana characters')
      end

      it 'last_name_katakanaが空では登録できない' do
        @user.last_name_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name katakana can't be blank")
      end

      it 'last_name_katakanaが全角カタカナ以外を含むと登録できない' do
        @user.last_name_katakana = '漢字ダメ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name katakana is invalid. Input full-width katakana characters')
      end

      it '生年月日が未入力だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
