require 'rails_helper'

RSpec.describe Post, type: :moddel do
  
  it "投稿ができる" do
    user = User.create(
      id: 5,
      name: "sample01",
      email: "sample01@example.com",
      password: "sample01"
    )
    post = Post.new(
      user_id: 5,
      content: "test"
    )
    expect(post).to be_valid
  end

  it "コンテンツが空の投稿はできない"do
    user = User.create(
      id: 6,
      name: "sample02",
      email: "sample02@example.com",
      password: "sample02"
    )
    post = Post.new(
      user_id: 6
    )
    expect(post).to be_invalid
  end

end