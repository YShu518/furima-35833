require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品商品新規登録' do
    context '内容に問題がない場合' do
      it '全ての情報が存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'nameが空だと登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'descriptionが空だと登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'category_idが空だと登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'category_idが数字以外だと登録できない' do
        @item.category_id = 'abc'
        @item.valid?
        expect(@item.errors.full_messages).to include('Category is not a number')
      end

      it 'category_idが1だと登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end

      it 'area_idが空だと登録できない' do
        @item.area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end

      it 'area_idが数字以外だと登録できない' do
        @item.area_id = 'abc'
        @item.valid?
        expect(@item.errors.full_messages).to include('Area is not a number')
      end

      it 'area_idが1だと登録できない' do
        @item.area_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Area must be other than 1')
      end

      it 'shopping_cost_idが空だと登録できない' do
        @item.shopping_cost_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shopping cost can't be blank")
      end

      it 'shopping_cost_idが数字以外だと登録できない' do
        @item.shopping_cost_id = 'abc'
        @item.valid?
        expect(@item.errors.full_messages).to include('Shopping cost is not a number')
      end

      it 'shopping_cost_idが１だと登録できない' do
        @item.shopping_cost_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Shopping cost must be other than 1')
      end

      it 'takes_day_idが空だと登録できない' do
        @item.takes_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Takes day can't be blank")
      end

      it 'takes_day_idが数字以外だと登録できない' do
        @item.takes_day_id = 'abc'
        @item.valid?
        expect(@item.errors.full_messages).to include('Takes day is not a number')
      end

      it 'takes_day_idが１だと登録できない' do
        @item.takes_day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Takes day must be other than 1')
      end

      it 'priceが空だと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが数字以外だと登録できない' do
        @item.price = 'abc'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it 'priceが300未満だと登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it 'priceが9999999より大きいと登録できない' do
        @item.price = '1000000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end

      it 'priceが小数を含むと登録できない' do
        @item.price = '500.01'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be an integer')
      end

      it 'priceが全角数字では登録できない' do
        @item.price = '１２３'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end
