require 'rails_helper'

RSpec.describe 'Comments', type: :request do
  let!(:user) { create(:user) }
  let!(:mountain) { create(:mountain) }
  let!(:comment) { create(:comment, user_id: user.id, mountain_id: mountain.id) }  
  
  before do
    sign_in user
  end

  describe 'comment#index' do
    it 'statusが200であること' do
      get comments_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'comment#edit' do
    it 'statusが200であること' do
      get edit_comment_path(comment.id)
      expect(response).to have_http_status(200)
    end
  end

  describe 'comment#update' do
    it '口コミを編集できること' do
      comment.title = 'hogehoge'
      expect(comment.reload.title).to eq 'hogehoge'
    end
  end
end
