require 'rails_helper'

RSpec.describe "Home#index", type: :system do
  describe "Header" do
    before do
      visit root_path
    end

    it "TOPボタンを押すと、TOPページにアクセスできること" do
      click_link "TOP"
      expect(current_path).to eq root_path
    end

    it "「山を探す」ボタンを押すと、mountain#indexにアクセスできること" do
      click_link "山を探す"
      expect(current_path).to eq mountains_path
    end
  end
end
