require 'rails_helper'

RSpec.describe 'Contact', type: :request do
  describe 'contact#index' do
    it 'statusが200であること' do
      get contact_index_path
      expect(response).to have_http_status(200)
    end
  end
end
