class UsersController < ApplicationController
  def new
    @user = User.find(params[:id])
  end
  
  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
    )
    if params[:password] == params[:password2] && @user.save
      session[:user_id] = @user.id
      flash[:notice] ="ユーザー登録に成功しました"
      redirect_to("/posts/index")
    elsif params[:name].blank? 
      flash[:alert] = "ユーザー名を登録してください"
      redirect_to("/signup")
    elsif params[:email].blank?
      flash[:alert] = "メールアドレスを登録してください"
      redirect_to("/signup")
    elsif params[:password].blank?
      flash[:alert] = "パスワードを登録してください"
      redirect_to("/signup")
    elsif params[:password] != params[:password2]
      flash[:alert] = "パスワードとパスワード確認が一致しません"
      redirect_to("/signup")
    end
    @user.save
  end

  def login_form
  end

  def login
    @user = User.find_by(email: params[:email])
    if @user && @user.pasword == params[:password]
      session[:user_id] = @user.id
      flash[:notice] = "ログインに成功しました"
      redirect_to("/posts/index")
    elsif @user!
      flash[:alert] = "メールアドレスが間違っています"
      render("login_form")
    elsif @user.password != params[:password]
      flash[:alert] = "パスワードが間違っています"
      render("login_form")
    end
  end
end
