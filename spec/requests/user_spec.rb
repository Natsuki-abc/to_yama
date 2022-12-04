require 'rails_helper'

RSpec.describe 'User', type: :request do
  describe '新規登録' do
    it 'statusが200であること' do
      get new_user_registration_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'ログイン' do
    it 'statusが200であること' do
      get new_user_session_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'パスワード再設定' do
    it 'statusが200であること' do
      get new_password_path(resource_name)
      expect(response).to have_http_status(200)
    end
  end

  describe '編集' do
    before do
      @user = FactoryBot.create(:user)
      sign_in @user
    end
    
    it 'statusが200であること' do
      get edit_user_registration_path(@user.id)
      expect(response).to have_http_status(200)
    end
  end
end
