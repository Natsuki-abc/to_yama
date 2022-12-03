require 'rails_helper'

RSpec.describe 'Mountains', type: :request do
  let(:mountain) { create(:mountain) }

  describe 'mountain#index' do
    it 'statusが200であること' do
      get mountains_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'mountain#show' do
    it 'statusが200であること' do
      get mountain_path(mountain.id)
      expect(response).to have_http_status(200)
    end
  end
end
