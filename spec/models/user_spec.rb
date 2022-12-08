require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Userの新規登録が有効である場合' do
    it '名前、メールアドレス、パスワードが入力されている場合、有効であること' do
      expect(FactoryBot.create(:user)).to be_valid
    end
  end

  context 'userが新規登録が無効な場合' do
    it '名前がない場合、無効であること' do
      expect(FactoryBot.build(:user, name: '')).not_to be_valid
    end

    it 'メールアドレスがない場合、無効であること' do
      expect(FactoryBot.build(:user, email: '')).not_to be_valid
    end

    it 'メールアドレスが重複している場合、無効であること' do
      user1 = FactoryBot.create(:user, name: 'taro', email: 'taro@example.com')
      expect(FactoryBot.build(:user, name: 'ziro', email: user1.email)).not_to be_valid
    end

    it 'パスワードがない場合、無効であること' do
      expect(FactoryBot.build(:user, password: '')).not_to be_valid
    end

    it 'パスワード(確認用)がない場合、無効であること' do
      expect(FactoryBot.build(:user, password_confirmation: '')).not_to be_valid
    end

    it 'password_confirmationとpasswordが異なる場合、無効であること' do
      expect(FactoryBot.build(:user, password: 'test1234', password_confirmation: 'test1235')).not_to be_valid
    end

    it 'パスワードが英語/数字のみの場合、無効であること' do
      expect(FactoryBot.build(:user, password: 'abcdefgh', password_confirmation: 'abcdefgh')).not_to be_valid
      expect(FactoryBot.build(:user, password: '12345678', password_confirmation: '12345678')).not_to be_valid
    end

    it 'パスワードが8文字未満の場合、無効であること' do
      expect(FactoryBot.build(:user, password: 'abc123', password_confirmation: 'abc123')).not_to be_valid
    end
  end

  it 'パスワードがハッシュ化されていること' do
    user = FactoryBot.create(:user)
    expect(user.encrypted_password).not_to eq 'test1234'
  end
end
