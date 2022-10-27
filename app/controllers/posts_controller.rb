class PostsController < ApplicationController
  def new
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(
      content: params[:content],
      user_id: @current_user.id
    )
    if @post.save
      redirect_to('/posts/index')
    end
  end

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.fins(params[:id])
    @post.destroy
    redirect_to("/posts/index")
  end
end
