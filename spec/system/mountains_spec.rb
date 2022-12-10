require 'rails_helper'

RSpec.describe 'Mountains', type: :system do
  let!(:mountain) { create(:mountain, area: '四国') }

  describe 'mountain#index' do
    before do
      visit mountains_path
    end

    it '検索結果画面にアクセスできること' do
      within '.area_table' do
        click_link '四国'
        expect(current_path).to eq search_mountains_path
      end
    end
  end

  describe 'mountain#search' do
    let!(:hokkaido_mountain) { create(:mountain, area: '北海道') }
    let!(:tohoku_mountain) { create(:mountain, area: '東北') }

    before do
      visit search_mountains_path(q: { area_cont: '四国' })
    end

    it '検索結果画面に違う地域の山が含まれていないこと' do
      expect(page).not_to have_content(hokkaido_mountain.area)
      expect(page).not_to have_content(tohoku_mountain.area)
    end

    it '検索結果画面の「合計」の個数があっていること' do
      expect(page.all('.search_content').count).to eq 1
    end

    it '検索結果画面で山の情報が表示されていること' do
      expect(page).to have_content(mountain.mountain_name)
      expect(page).to have_content(mountain.address)
      expect(page).to have_content(mountain.time)
      expect(page).to have_content(mountain.elevation)
      expect(page).to have_content(mountain.station)
      expect(page).to have_content(mountain.season)
      expect(page).to have_content(mountain.parking)
      expect(page).to have_content(mountain.distance)
    end

    it '山の画像をクリックするとmountain#showに移管すること' do
      within '.search_mountain1' do
        click_link
        expect(current_path).to eq mountain_path(mountain.id)
      end
    end
  end
end
