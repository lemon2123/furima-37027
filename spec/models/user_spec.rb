require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '全て存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it '名字(全角)が空では登録できない' do
      @user.last_name_zen = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name zen can't be blank", "Last name zen 全角文字を使用してください")
    end
    it '名字(全角)でなければ登録できない' do
      @user.last_name_zen = 'AA'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name zen 全角文字を使用してください")
    end
    it '名前(全角)が空では登録できない' do
      @user.first_name_zen = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name zen can't be blank", "First name zen 全角文字を使用してください")
    end
    it '名前(全角)でなければ登録できない' do
      @user.first_name_zen = 'BB'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name zen 全角文字を使用してください")
    end
    it '名字カナ(全角)が空では登録できない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank", "Last name kana 全角カナ文字を使用してください")
    end
    it '名字カナ(全角)でなければ登録できない' do
      @user.last_name_kana = 'あいう'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana 全角カナ文字を使用してください")
    end
    it '名前カナ(全角)が空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank", "First name kana 全角カナ文字を使用してください")
    end
    it '名前カナ(全角)でなければ登録できない' do
      @user.first_name_kana = 'えお'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana 全角カナ文字を使用してください")
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'emailは@を含まないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordが129文字以上では登録できない' do
      @user.password = Faker::Internet.password(min_length: 129)
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too long (maximum is 128 characters)")
    end
    it 'passwordが半角英数字混合以外では登録できない' do
      @user.password = 'あいうえおか'
      @user.password_confirmation = 'あいうえおか'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password 英字と数字の両方を含めて設定してください")
    end
    it 'passwordが英字のみでは登録できない' do
      @user.password = 'abcdef'
      @user.password_confirmation = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password 英字と数字の両方を含めて設定してください")
    end
    it 'passwordが数字のみでは登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password 英字と数字の両方を含めて設定してください")
    end
    it 'passwordが全角文字を含んでいる場合登録できない' do
          @user.password = 'ａｂｃｄｅｆ１'
          @user.password_confirmation = 'ａｂｃｄｅｆ１'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password 英字と数字の両方を含めて設定してください")
    end
    it '生年月日が空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
  end
end
