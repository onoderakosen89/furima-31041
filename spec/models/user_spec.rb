require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'passwordが空では登録できない' do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'family_nameが空では登録できない' do
      @user.family_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end
    it 'first_nameが空では登録できない' do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'family_name_kanaが空では登録できない' do
      @user.family_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank")
    end
    it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it 'birthdayが空では登録できない' do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
        it 'パスワードに英小文字が含まれない場合無効な状態であること' do
          user = User.new(password: '1'+'A' * 5, password_confirmation: '1A'+'a' * 3)
          user.valid?
          expect(user.errors[:password]).to include('は半角6~12文字英大文字・小文字・数字それぞれ１文字以上含む必要があります')
        end
      
        it 'パスワードに英大文字が含まれない場合無効な状態であること' do
          user = User.new(password: '1'+'a' * 5, password_confirmation: '1A'+'a' * 3)
          user.valid?
          expect(user.errors[:password]).to include('は半角6~12文字英大文字・小文字・数字それぞれ１文字以上含む必要があります')
        end
      
        it 'パスワードに数字が含まれない場合無効な状態であること' do
          user = User.new(password: 'A'+'a' * 5, password_confirmation: '1A'+'a' * 3)
          user.valid?
          expect(user.errors[:password]).to include('は半角6~12文字英大文字・小文字・数字それぞれ１文字以上含む必要があります')
        end
      
        it 'パスワードが5文字以下なら無効な状態であること' do
          user = User.new(password: '1A'+'a' * 3, password_confirmation: '1A'+'a' * 3)
          user.valid?
          expect(user.errors[:password]).to include('は半角6~12文字英大文字・小文字・数字それぞれ１文字以上含む必要があります')
        end
      
        it 'パスワードが13文字以上なら無効な状態であること' do
          user = User.new(password: '1A'+'a' * 11, password_confirmation: '1A'+'a' * 11)
          user.valid?
          expect(user.errors[:password]).to include('は半角6~12文字英大文字・小文字・数字それぞれ１文字以上含む必要があります')
        end
  end

end
