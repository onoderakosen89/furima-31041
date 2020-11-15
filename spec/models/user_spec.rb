require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      user = User.new(nickname: ' ', email: 'test@example', password: '000000', password_confirmation: '000000', family_name: '田中', first_name: '太郎', family_name_kana: 'タナカ', first_name_kana: 'タロウ', birthday:'1')
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      user = User.new(nickname: 'テストユーザー', email: ' ', password: '000000', password_confirmation: '000000', family_name: '田中', first_name: '太郎', family_name_kana: 'タナカ', first_name_kana: 'タロウ', birthday:'1')
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it 'passwordが空では登録できない' do
      user = User.new(nickname: 'テストユーザー', email: 'test@example', password: ' ', password_confirmation: ' ', family_name: '田中', first_name: '太郎', family_name_kana: 'タナカ', first_name_kana: 'タロウ', birthday:'1')
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it 'family_nameが空では登録できない' do
      user = User.new(nickname: 'テストユーザー', email: 'test@example', password: '000000', password_confirmation: '000000', family_name: ' ', first_name: '太郎', family_name_kana: 'タナカ', first_name_kana: 'タロウ', birthday:'1')
      user.valid?
      expect(user.errors.full_messages).to include("Family name can't be blank")
    end
    it 'first_nameが空では登録できない' do
      user = User.new(nickname: 'テストユーザー', email: 'test@example', password: '000000', password_confirmation: '000000', family_name: '田中', first_name: ' ', family_name_kana: 'タナカ', first_name_kana: 'タロウ', birthday:'1')
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end
    it 'family_name_kanaが空では登録できない' do
      user = User.new(nickname: 'テストユーザー', email: 'test@example', password: '000000', password_confirmation: '000000', family_name: '田中', first_name: '太郎', family_name_kana: ' ', first_name_kana: 'タロウ', birthday:'1')
      user.valid?
      expect(user.errors.full_messages).to include("Family name kana can't be blank")
    end
    it 'first_name_kanaが空では登録できない' do
      user = User.new(nickname: 'テストユーザー', email: 'test@example', password: '000000', password_confirmation: '000000', family_name: '田中', first_name: '太郎', family_name_kana: 'タナカ', first_name_kana: '', birthday:'1')
      user.valid?
      expect(user.errors.full_messages).to include("First name kana can't be blank")
    end
    it 'birthdayが空では登録できない' do
      user = User.new(nickname: 'テストユーザー', email: 'test@example', password: '000000', password_confirmation: '000000', family_name: '田中', first_name: '太郎', family_name_kana: 'タナカ', first_name_kana: 'タロウ', birthday:'')
      user.valid?
      binding.pry
      expect(user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end