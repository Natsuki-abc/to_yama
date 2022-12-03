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

  describe 'mountain#search' do
    it 'statusが200であること' do
      get search_mountains_path(q:{area_cont:"mountain.area"})
      expect(response).to have_http_status(200)
    end

    it 'statusが200であること' do
      get search_mountains_path(q:{address_cont:"mountain.address"})
      expect(response).to have_http_status(200)
    end

    it 'statusが200であること' do
      get search_mountains_path(q:{mountain_name_cont:"mountain.mountain_name"})
      expect(response).to have_http_status(200)
    end

    it 'statusが200であること' do
      get search_mountains_path(q:{time_cont:"mountain.time"})
      expect(response).to have_http_status(200)
    end

    it 'statusが200であること' do
      get search_mountains_path(q:{elevation_cont:"mountain.elevation"})
      expect(response).to have_http_status(200)
    end

    it 'statusが200であること' do
      get search_mountains_path(q:{atation_cont:"mountain.staion"})
      expect(response).to have_http_status(200)
    end

    it 'statusが200であること' do
      get search_mountains_path(q:{season_cont:"mountain.season"})
      expect(response).to have_http_status(200)
    end

    it 'statusが200であること' do
      get search_mountains_path(q:{parking_cont:"mountain.parking"})
      expect(response).to have_http_status(200)
    end

    it 'statusが200であること' do
      get search_mountains_path(q:{distance_cont:"mountain.distance"})
      expect(response).to have_http_status(200)
    end

    it 'statusが200であること' do
      get search_mountains_path(q:{furigana_cont:"mountain.furigana"})
      expect(response).to have_http_status(200)
    end
  end
end
