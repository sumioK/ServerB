require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'valid' do
    it "正常にユーザー登録が可能" do
      user = User.new(
        name: "sample",
        email: "sample@example.com",
        password: "sample"
      )
      user.save
      expect(user).to be_valid
    end

    it "ユーザー名が空の場合は登録できない" do
      user = User.new(
        email: "sample2@example.com",
        password: "sample2"
      )
      expect(user).to be_invalid
    end

    it "Emailが空の場合は登録できない" do
      user = User.new(
        name: "sample3",
        password: "sample3"
      )
      expect(user).to be_invalid
    end

    it "パスワードが空の場合は登録できない" do
      user = User.new(
        name: "sample4",
        email: "sample4@example.com"
      )
      expect(user).to be_invalid
    end
  end
end