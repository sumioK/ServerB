require 'rails_helper'

RSpec.describe 'Posts', type: :system do
  before do
    User.create(
      id: 1000,
      name: "sample0000",
      email: "sample0000@example.com",
      password: "sample0000"
    )
  end
  describe 'ログイン時' do
    before do
      visit "/login"
      fill_in "email", with: "sample0000@example.com"
      fill_in "password", with: "sample0000"
      click_button "ログイン"
    end
    it 'ログイン時、新規投稿画面へアクセス可能' do
      visit "/posts/new"
      expect(current_path).to eq "/posts/new"
    end

    it 'ログイン時、投稿一覧画面へアクセス可能' do
      visit "/posts/index"
      expect(current_path).to eq "/posts/index"
    end

    it 'ログイン時、新規投稿が可能' do
      visit "/posts/new"
      fill_in "content", with: "test0000"
      click_button "投稿"
      expect(current_path).to eq "/posts/index"
      expect(page).to have_content "test0000"
    end
  end

  describe '非ログイン時' do
    it '非ログイン時、新規投稿画面へアクセスできない' do
      visit "/posts/new"
      expect(current_path).to eq "/login"
    end
    it '非ログイン時、投稿一覧画面へアクセス可能' do
      visit "/posts/index"
      expect(current_path).to eq "/posts/index"
    end
  end
end