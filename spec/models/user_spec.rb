require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    it "全部入力していると登録できる" do
      expect(@user).to be_valid
    end
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end


    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "重複したemailが存在する場合登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken") 
    end
    it 'emailが@がなければ登録できない' do
      @user.email = 'testgmail.com'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    
    
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "passwordが6文字以下であれば登録できない" do
      @user.password = 'Test1'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "passwordとpassword_confirmationが一致する必要がある" do
      @user.password_confirmation = 'test12'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'passwordに英小文字が含まれない場合無効な状態であること' do
      user = User.new(password: '1' + 'A' * 5, password_confirmation: '1A' + 'a' * 3)
      user.valid?
      expect(user.errors[:password]).to include('は半角6~12文字英大文字・小文字・数字それぞれ１文字以上含む必要があります')
    end

    it 'passwordに英大文字が含まれない場合無効な状態であること' do
      user = User.new(password: '1' + 'a' * 5, password_confirmation: '1A' + 'a' * 3)
      user.valid?
      expect(user.errors[:password]).to include('は半角6~12文字英大文字・小文字・数字それぞれ１文字以上含む必要があります')
    end

    it 'passwordに数字が含まれない場合無効な状態であること' do
      user = User.new(password: 'A' + 'a' * 5, password_confirmation: '1A' + 'a' * 3)
      user.valid?
      expect(user.errors[:password]).to include('は半角6~12文字英大文字・小文字・数字それぞれ１文字以上含む必要があります')
    end

    it 'passwordが5文字以下なら無効な状態であること' do
      user = User.new(password: '1A' + 'a' * 3, password_confirmation: '1A' + 'a' * 3)
      user.valid?
      expect(user.errors[:password]).to include('は半角6~12文字英大文字・小文字・数字それぞれ１文字以上含む必要があります')
    end

    it 'passwordが13文字以上なら無効な状態であること' do
      user = User.new(password: '1A' + 'a' * 11, password_confirmation: '1A' + 'a' * 11)
      user.valid?
      expect(user.errors[:password]).to include('は半角6~12文字英大文字・小文字・数字それぞれ１文字以上含む必要があります')
    end


    it 'family_nameが空では登録できない' do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end
    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'ユーザー名字は、全角での入力が必須であること' do
      @user.family_name = 'tanaka'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name 全角文字を使用してください")
    end
    it 'ユーザー名前は、全角での入力が必須であること' do
      @user.first_name = 'tarou'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
    end
    it 'family_name_kanaが空では登録できない' do
      @user.family_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank")
    end
    it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it 'ユーザー名字は、カタカナでの入力が必須であること' do
      @user.family_name_kana= 'tanaka'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana カタカナを使用してください")
    end
    it 'ユーザー名前は、カタカナでの入力が必須であること' do
      @user.first_name_kana = 'tarou'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana カタカナを使用してください")
    end
    
    
    it 'birthdayが空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end 
  end
end
