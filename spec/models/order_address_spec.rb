require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    sleep(0.1)
    @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
  end

  describe '購入情報登録' do
    context '登録できる場合'do
      it '全ての情報が存在すれば登録できる' do
        expect(@order_address).to be_valid
      end

      it 'address_line2がなくても登録できる' do
        @order_address.address_line2 = ''
        expect(@order_address).to be_valid
      end

      it 'phone_numberが10桁でも登録できる' do 
        @order_address.phone_number = '0123456789'
        expect(@order_address).to be_valid
      end
    end

    context '登録できない場合' do
      it 'tokenが存在しない場合' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'postal_cordが存在しない場合' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_cordが半角数字のみの場合' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it 'postal_cordが半角数字とハイフン以外を含む場合' do
        @order_address.postal_code = 'a12-3456'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it 'postal_cordが全角数字では登録できない' do
        @order_address.postal_code ='１２３-４５６７'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it 'area_idが空だと登録できない' do
        @order_address.area_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Area can't be blank")
      end

      it 'area_idが数字以外だと登録できない' do
        @order_address.area_id = 'abc'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Area is not a number')
      end

      it 'area_idが1だと登録できない' do
        @order_address.area_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Area must be other than 1')
      end

      it 'cityが存在しない場合' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it 'address_line1が存在しない場合' do
        @order_address.address_line1 = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address line1 can't be blank")
      end

      it 'phone_numberが存在しない場合' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが9桁以下の場合' do
        @order_address.phone_number = '012345678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end

      it 'phone_numberが12桁以上の場合' do
        @order_address.phone_number = '012345678901'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end

      it 'phone_numberが0以外から始まる場合' do
        @order_address.phone_number = '1234567890'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end

      it 'phone_numberが全角数字の場合' do
        @order_address.phone_number = '０１２３４５６７８９０'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end

      it 'phone_numberが半角数字以外を含む場合' do
        @order_address.phone_number = '012-345-6789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end

      it 'user_idが存在しない場合' do
        @order_address.user_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが存在しない場合' do
        @order_address.item_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
