require 'rails_helper'

RSpec.describe 'Users', type: :system do
  describe '新規登録' do
    it 'ユーザーの新規登録が成功する'

    it 'メールアドレスが未入力だと新規登録に失敗する'

    it 'メールアドレスが一意でないと新規登録に失敗する'
  end

  describe '制限ページ' do
    it 'ログインに成功する'

    it '投稿一覧画面はログインしていなくても閲覧可能'

    it '投稿画面はログインしていないとアクセスできない'

    it 'ログイン画面は非ログイン状態でないとアクセスできない'

    it '新規登録画面は非ログイン状態でないとアクセスできない'
  end
end