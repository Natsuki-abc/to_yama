require 'rails_helper'

RSpec.describe 'devise/sign_up', type: :system do
  it 'TOPページにログイン/新規登録ボタンがあること' do
    visit root_path
    expect(page).to have_content('ログイン')
    expect(page).to have_content('新規登録')
  end
end
