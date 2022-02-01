require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'ニックネームが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'メールアドレスが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'メールアドレスが一意でないと登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'メールアドレスは、@を含む必要があること' do
      @user.email = 'aaagmail.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it 'パスワードが必須であること' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it ' パスワードは、6文字以上での入力が必須であること' do
      @user.password = '1a'
      @user.password_confirmation = '1a'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'パスワードが英字のみの場合登録できない。' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password は半角英数を両方含む必要があります')
    end

    it 'パスワードが数字のみの場合登録できない。' do
      @user.password = '111111'
      @user.password_confirmation = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password は半角英数を両方含む必要があります')
    end

    it 'パスワードとパスワード（確認）は、値の一致が必須であること' do
      @user.password = '111aaa'
      @user.password_confirmation = '111bbb'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'お名前(全角)は、名字が必須であること' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'お名前(全角)は、名前がそれぞれ必須であること' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it ' お名前(全角)の名字は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
      @user.last_name = 'bb'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name は全角日本語（かな、カナ、漢字のみ）である必要があります')
    end

    it ' お名前(全角)の名前は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
      @user.first_name = 'aa'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name は全角日本語（かな、カナ、漢字のみ）である必要があります')
    end

    it 'お名前カナ(全角)は、名字と名前がそれぞれ必須であること' do
      @user.first_name_kana = ''
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it 'お名前カナ(全角)は、全角（カタカナ）での入力が必須であること' do
      @user.first_name_kana = 'aaa'
      @user.last_name_kana = 'bbb'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana は全角カタカナである必要があります')
    end

    it '生年月日が必須であること' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
