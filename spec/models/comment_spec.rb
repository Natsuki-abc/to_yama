require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'Commentの新規登録が有効な場合' do
    it '必須情報が全て入力されていると、有効であること' do
      expect(FactoryBot.create(:comment)).to be_valid
    end
  end

  context 'Commentの新規登録が無効な場合' do
    it 'タイトルが入力されていない場合、無効であること' do
      expect(FactoryBot.build(:comment, title: '')).not_to be_valid
    end

    it 'コメント内容が入力されていない場合、無効であること' do
      expect(FactoryBot.build(:comment, content: '')).not_to be_valid
    end
  end
end
