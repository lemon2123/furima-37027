require 'rails_helper'

RSpec.describe RecordAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @record_address = FactoryBot.build(:record_address, user_id: user.id, item_id: item.id)
    end

    context '商品の購入ができるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@record_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @record_address.building_name = ''
        expect(@record_address).to be_valid
      end
    end

    context '商品の購入ができないとき' do
      it 'tokenが空では登録できないこと' do
        @record_address.token = nil
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'post_codeが空だと購入できないこと' do
        @record_address.post_code = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと購入できないこと' do
        @record_address.post_code = '1234567'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it '発送先の地域が選択されていないと購入できないこと' do
        @record_address.delivery_area_id = 1
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Delivery area can't be blank")
      end
      it '市区町村が空だと購入できないこと' do
        @record_address.delivery_city = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Delivery city can't be blank")
      end
      it '番地が空だと購入できないこと' do
        @record_address.delivery_number = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Delivery number can't be blank")
      end
      it '電話番号が空だと購入できないこと' do
        @record_address.phone_number = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が9桁以下だと購入できないこと' do
        @record_address.phone_number = '090123456'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Phone number 10桁か11桁の数字を使用してください")
      end
      it '電話番号が12桁以上だと購入できないこと' do
        @record_address.phone_number = '090123456789'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Phone number 10桁か11桁の数字を使用してください")
      end
      it '電話番号に全角数字が含まれている場合、購入できないこと' do
        @record_address.phone_number = '０９０１２３４５６７８'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Phone number 10桁か11桁の数字を使用してください")
      end
      it 'userが紐付いていないと購入できないこと' do
        @record_address.user_id = nil
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと購入できないこと' do
        @record_address.item_id = nil
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
