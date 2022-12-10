require 'rails_helper'

RSpec.describe 'FAQ', type: :request do
  describe 'faq#index' do
    it 'statusが200であること' do
      get faq_index_path
      expect(response).to have_http_status(200)
    end
  end
end
