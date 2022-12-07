require 'rails_helper'

RSpec.describe 'User', type: :system do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end  

    it 'TOPページに「新規登録」ボタンがあること' do
      visit root_path
      expect(page).to have_content('新規登録')
    end

    context '新規登録できる場合' do
      it '必須情報が全て入力されていれば、新規登録でき、TOPページへ移管すること' do
        expect{
          visit new_user_registration_path
          fill_in 'user[name]', with: @user.name
          fill_in 'user[email]', with: @user.email
          fill_in 'user[password]', with: @user.password
          fill_in 'user[password_confirmation]', with: @user.password_confirmation
          click_button "新規登録"
        }.to change { User.count }.by(1)

        expect(current_path).to eq root_path
      end
    end

    context '新規登録できない場合' do
      it '必須情報が入力されていなければ、新規登録できず、新規登録ページへ戻ること' do
        expect{
          visit new_user_registration_path
          fill_in 'user[name]', with: ''
          fill_in 'user[email]', with: ''
          fill_in 'user[password]', with: ''
          fill_in 'user[password_confirmation]', with: ''
          click_button '新規登録'
        }.to change { User.count }.by(0)

        expect(current_path).to eq ('/users')
      end
    end
  end

  describe 'ログイン' do
    before do
      @user = FactoryBot.create(:user)
    end
  
    it 'TOPページに「ログイン」ボタンがあること' do
      visit root_path
      expect(page).to have_content('ログイン')
    end
  
    context 'ログインできる場合' do
      it '保存されているユーザー情報と合致すれば、ログインでき、TOPページへ移管すること' do
        visit new_user_session_path
  
        fill_in 'user[email]', with: @user.email
        fill_in 'user[password]', with: @user.password
        click_button 'ログイン'
  
        expect(current_path).to eq(root_path)
      end
    end
  
    context 'ログインできない場合' do
      it '保存されているユーザー情報と合致しなければ、ログインできず、ログインページへ戻ること' do
        visit new_user_session_path
  
        fill_in 'user[email]', with: ''
        fill_in 'user[password]', with: ''
        click_button 'ログイン'
  
        expect(current_path).to eq(new_user_session_path)
      end
    end
  end
end
