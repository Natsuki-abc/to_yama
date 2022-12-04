require 'rails_helper'

RSpec.describe Mountain, type: :model do
  context 'Mountainの新規登録が有効な場合' do
    it '必須情報が全て入力されていると、有効であること' do
      expect(FactoryBot.create(:mountain)).to be_valid
    end
  end

  context 'Mountainの新規登録が無効な場合' do
    it '山の名前がない場合、無効であること' do
      expect(FactoryBot.build(:mountain, mountain_name: '')).not_to be_valid
    end

    it '住所がない場合、無効であること' do
      expect(FactoryBot.build(:mountain, address: '')).not_to be_valid
    end

    it '総歩行時間がない場合、無効であること' do
      expect(FactoryBot.build(:mountain, time: '')).not_to be_valid
    end

    it '標高がない場合、無効であること' do
      expect(FactoryBot.build(:mountain, elevation: '')).not_to be_valid
    end

    it '難易度がない場合、無効であること' do
      expect(FactoryBot.build(:mountain, difficulty: '')).not_to be_valid
    end

    it '最寄駅がない場合、無効であること' do
      expect(FactoryBot.build(:mountain, station: '')).not_to be_valid
    end

    it '最適シーズンがない場合、無効であること' do
      expect(FactoryBot.build(:mountain, season: '')).not_to be_valid
    end

    it '駐車場情報がない場合、無効であること' do
      expect(FactoryBot.build(:mountain, parking: '')).not_to be_valid
    end

    it '歩行距離がない場合、無効であること' do
      expect(FactoryBot.build(:mountain, distance: '')).not_to be_valid
    end

    it 'ふりがながない場合、無効であること' do
      expect(FactoryBot.build(:mountain, furigana: '')).not_to be_valid
    end
  end
end
