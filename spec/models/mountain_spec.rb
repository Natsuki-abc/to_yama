require 'rails_helper'

RSpec.describe Mountain, type: :model do
  context "山の新規登録が有効な場合" do
    it "必須情報(山の名前、住所、総歩行時間、標高、難易度、最寄駅、最適シーズン、駐車場情報、歩行距離)が全て入力されていること" do
      expect(FactoryBot.create(:user)).to be_valid
    end
  end

  context "山の新規登録ができない場合" do
    it "" do
    end
  end
end
