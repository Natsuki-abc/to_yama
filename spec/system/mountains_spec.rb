require 'rails_helper'

RSpec.describe 'Mountains', type: :system do
  describe '#index' do
    before do
      visit mountains_path
    end

    it '検索結果画面にアクセスできること' do
    end
  end
end
