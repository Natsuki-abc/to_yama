require 'rails_helper'

RSpec.describe 'Comments', type: :system do
  describe 'comment#index' do
    let!(:user) { create(:user) }
    let!(:mountain) { create(:mountain) }
    let!(:comment) { create(:comment, user_id: user.id, mountain_id: mountain.id) }
    let!(:other_user) { create(:user) }
    let!(:other_mountain) { create(:mountain) }
    let!(:other_comment) { create(:comment, user_id: other_user.id, mountain_id: other_mountain.id) }

    before do
      sign_in user
      visit comments_path
    end

    it 'ログイン中のユーザーが投稿した口コミのみ表示されること' do
      within '.comment_index' do
        expect(page).to have_content(comment.title)
        expect(page).to have_content(comment.content)
      end
    end

    it '口コミをした山の名前が表示されていること' do
      expect(page).to have_content(comment.mountain.mountain_name)
    end

    it 'ログインしていないユーザーが投稿した口コミは表示されないこと' do
      within '.comment_index' do
        expect(page).not_to have_content(other_comment.title)
        expect(page).not_to have_content(other_comment.content)
      end
    end

    it '山の名前をクリックすると、mountain#showページに移管すること' do
      click_link comment.mountain.mountain_name
      expect(current_path).to eq mountain_path(comment.mountain_id)
    end
  end
end
