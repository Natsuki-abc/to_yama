require 'rails_helper'

RSpec.describe 'Comments', type: :request do
  describe 'comment#index' do
    before do
      @user = FactoryBot.create(:user)
      sign_in @user
      @mountain = FactoryBot.create(:mountain)
      @comment = FactoryBot.create(:comment)
    end

    it 'statusが200であること' do
      get comments_path
      expect(response).to have_http_status(200)
    end
  end
end
