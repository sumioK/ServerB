class PostsController < ApplicationController
  before_action :set_current_user
  before_action :authenticate_user,{only: [:new, :create, :destroy]}
  def new
  end

  def create
    @post = Post.new(
      content: params[:content],
      user_id: @current_user.id
    )
    if @post.save
      redirect_to("/posts/index")
    elsif params[:content].blank?
      flash[:alert] = "文章を入力してください"
      redirect_to("/posts/new")
    end
  end

  def index
    @posts = Post.all.order(created_at: :desc)
  end

end
