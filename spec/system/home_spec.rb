require 'rails_helper'

RSpec.describe 'Home#index', type: :system do
  before do
    visit root_path
  end

  describe 'Header' do
    it 'TOPボタンを押すと、TOPページにアクセスできること' do
      click_link 'TOP'
      expect(current_path).to eq root_path
    end

    it '「山を探す」ボタンを押すと、mountain#indexにアクセスできること' do
      click_link '山を探す'
      expect(current_path).to eq mountains_path
    end
  end

  describe 'Main' do
    it 'home#newに移管すること' do
      click_link 'View details »', match: :first
      expect(current_path).to eq new_home_path
    end

    it 'mountain#indexに移管すること' do
      within '.home_2' do
        click_link 'View details »'
        expect(current_path).to eq mountains_path
      end
    end

    it 'home#newページに移管すること' do
      within '.home_3' do
        click_link 'View details »'
        expect(current_path).to eq new_home_path
      end
    end
  end

  describe 'Footer' do
    it '「お問合せ（山の追加希望もこちら）」ボタンを押すと、home#newにアクセスできること' do
      click_link 'お問合せ（山の追加希望もこちら）'
      expect(current_path).to eq new_home_path
    end
  end
end
