require 'rails_helper'

RSpec.describe Post, type: :moddel do
  
  it "投稿ができる" do
    user = User.create(
      id: 5,
      name: "sample5",
      email: "sample5@example.com",
      password: "sample5"
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
      name: "sample6",
      email: "sample6@example.com",
      password: "sample6"
    )
    post = Post.new(
      user_id: 6
    )
    expect(post).to be_invalid
  end

end