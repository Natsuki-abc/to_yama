require 'rails_helper'

RSpec.describe 'Home#index', type: :system do
  before do
    visit root_path
  end

  describe 'Header' do
    it 'TOPボタンを押すと、TOPページにアクセスできること' do
      within 'header' do
        click_link 'TOP'
        expect(current_path).to eq root_path
      end
    end

    it '「山を探す」ボタンを押すと、mountain#indexにアクセスできること' do
      within 'header' do
        click_link '山を探す'
        expect(current_path).to eq mountains_path
      end
    end
  end

  describe 'Main' do
    it 'faq#indexに移管すること' do
      click_link 'View details »', match: :first
      expect(current_path).to eq faq_index_path
    end

    it 'mountain#indexに移管すること' do
      within '.home_2' do
        click_link 'View details »'
        expect(current_path).to eq mountains_path
      end
    end

    it 'contact#indexに移管すること' do
      within '.home_3' do
        click_link 'View details »'
        expect(current_path).to eq contact_index_path
      end
    end
  end

  describe 'Footer' do
    it '「お問合せ（山の追加希望もこちら）」をクリックすると、contact#indexに移管すること' do
      within 'footer' do
        click_link 'お問合せ（山の追加希望もこちら）'
        expect(current_path).to eq contact_index_path
      end
    end

    it '「FAQ」をクリックすると、faq#indexに移管すること' do
      within 'footer' do
        click_link 'FAQ'
        expect(current_path).to eq faq_index_path
      end
    end
  end
end
