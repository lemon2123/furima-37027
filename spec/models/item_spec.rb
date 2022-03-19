require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の新規登録' do
    context '商品の出品ができるとき' do
      it 'すべての情報があれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品の出品ができないとき' do
      it '画像が空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が空では登録できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'カテゴリーが選択されていないと登録できない' do
        @item.detail_category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail category can't be blank")
      end
      it '商品の状態が選択されていないと登録できない' do
        @item.detail_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail status can't be blank")
      end
      it '配送料の負担が選択されていないと登録できない' do
        @item.delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery can't be blank")
      end
      it '発送元の地域が選択されていないと登録できない' do
        @item.delivery_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery area can't be blank")
      end
      it '発送までの日数が選択されていないと登録できない' do
        @item.delivery_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day can't be blank")
      end
      it '販売価格が300円未満では保存できないこと' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid')
      end
      it '販売価格が9,999,999円を超過すると保存できないこと' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid')
      end
    end
  end
end