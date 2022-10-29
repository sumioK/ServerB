require 'rails_helper'

RSpec.describe 'Users', type: :system do
  before do
    User.create(
    name: "sample000",
    email: "sample000@example.com",
    password: "sample000"
    )
  end
  describe '新規登録' do
    it 'ユーザーの新規登録が成功する' do
      visit '/signup'
      fill_in "name", with: "sample001"
      fill_in "email", with: "sample001@example.com"
      fill_in "password", with: "sample001"
      fill_in "password2", with: "sample001"
      click_button "登録"
      expect(page).to have_content "ユーザー登録に成功しました"
    end
    it 'メールアドレスが未入力だと新規登録に失敗する' do
      visit "signup"
      fill_in "name", with: "sample002"
      fill_in "password", with: "sample002"
      fill_in "password2", with: "sample002"
      click_button "登録"
      expect(current_path).to eq "/signup"
    end

    it 'メールアドレスが一意でないと新規登録に失敗する' do
      visit "signup"
      fill_in "name", with: "sample003"
      fill_in "email", with: "sample000@example.com"
      fill_in "password", with: "sample003"
      fill_in "password2", with: "sample003"
      expect(current_path).to eq "/signup"
    end
    it 'ログインに成功する' do
      visit "/login"
      fill_in "email", with: "sample000@example.com"
      fill_in "password", with: "sample000"
      click_button "ログイン"
      expect(page).to have_content "ログインに成功しました"
      expect(current_path).to eq "/posts/index"
    end
  end

  describe '制限ページ' do
    context 'ログインしていない状態' do

      it '非ログイン状態ではログイン画面へアクセス可能' do
        visit "/login"
        expect(current_path).to eq "/login"
      end

      it '非ログイン状態では新規登録画面へアクセス可能' do
        visit "/signup"
        expect(current_path).to eq "/signup"
      end

    end
    context 'ログインしている状態' do
      before do
        visit "/login"
        fill_in "email", with: "sample000@example.com"
        fill_in "password", with: "sample000"
        click_button "ログイン"
      end
      it 'ログイン画面は非ログイン状態でないとアクセスできない' do
        visit "/login"
        expect(current_path).to eq "/posts/index"
      end
      
      it '新規登録画面は非ログイン状態でないとアクセスできない' do
        visit "/signup"
        expect(current_path).to eq "/posts/index"
      end
    end
  end
end