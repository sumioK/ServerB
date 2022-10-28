class UsersController < ApplicationController
  def new
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
      redirect_to("/users/new")
    elsif params[:email].blank?
      flash[:alert] = "メールアドレスを登録してください"
      redirect_to("/users/new")
    elsif params[:password].blank?
      flash[:alert] = "パスワードを登録してください"
      redirect_to("/users/new")
    elsif params[:password] != params[:password2]
      flash[:alert] = "パスワードと確認用パスワードが一致しません"
      redirect_to("/users/new")
    else
      flash[:alert] = "メールアドレスが無効です"
      redirect_to("/users/new")
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
    elsif !@user
      flash[:alert] = "メールアドレスが間違っています"
      render("login_form")
    elsif @user.password != params[:password]
      flash[:alert] = "パスワードが間違っています"
      render("login_form")
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトに成功しました"
    redirect_to("/")
  end
end
