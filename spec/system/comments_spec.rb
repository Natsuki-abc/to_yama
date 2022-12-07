require 'rails_helper'

RSpec.describe 'Comments', type: :system do
  let!(:user) { create(:user) }
  let!(:mountain) { create(:mountain) }
  let!(:comment) { create(:comment, user_id: user.id, mountain_id: mountain.id) }
  let!(:other_user) { create(:user) }
  let!(:other_mountain) { create(:mountain) }
  let!(:other_comment) { create(:comment, user_id: other_user.id, mountain_id: other_mountain.id) }

  before do
    sign_in user
  end

  describe 'comment#index' do
    before do
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

    it '「編集する」をクリックすると、comment#editページに移管すること' do
      click_link '編集する'
      expect(current_path).to eq edit_comment_path(comment.id)
    end
  end

  describe 'comment#create' do
    before do
      visit mountain_path(mountain.id)
    end

    context 'ログインしている場合'do
      it 'タイトル・内容が入力されていると、口コミ投稿ができ、mountain#showのままであること' do
        within '.comment_create' do
          expect{
            fill_in 'comment[title]', with: '土曜日に行ってきました！'
            fill_in 'comment[content]', with: '駐車場にトイレもあり、良かったです。'
            click_button '口コミを投稿する'
          }.to change { Comment.count }.by(1)

          expect(current_path).to eq mountain_path(mountain.id)
        end
      end
    end

    context 'ログインしていない場合' do
      before do
        sign_out user
      end

      it 'タイトル・内容を入力しても、口コミ投稿できず、ログイン画面に移管すること' do
        within '.comment_create' do
          expect{
            fill_in 'comment[title]', with: '土曜日に行ってきました！'
            fill_in 'comment[content]', with: '駐車場にトイレもあり、良かったです。'
            click_button '口コミを投稿する'
          }.to change { Comment.count }.by(0)

          expect(current_path).to eq new_user_session_path
        end
      end
    end
  end

  describe 'comment#destroy' do
    before do
      visit edit_comment_path(comment.id)
    end

    it '口コミを削除できること' do
      click_link '口コミを削除する'
      expect{
        expect(page.accept_confirm).to eq '本当に削除しますか？'
        expect(page).to have_content '口コミを削除しました'
        }. to change{Comment.count}.by(-1)

        expect(current_path).to eq comments_path(user.id)
    end

    context 'アカウントを削除した場合' do
      it 'userを削除すると、userが書いたcommentも削除されること' do
        expect{ user.destroy }.to change{ Comment.count }.by(-1)
      end
    end  
  end
end
