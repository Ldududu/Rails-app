module SessionsHelper

  def log_in(user)
    session[:user_id] = user.id
  end

  #ユーザーのセッションを永続化
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  #現在のログインユーザーを返す(永続かどうかで場合分け)
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    elsif cookies.signed[:user_id]
      user = User.find_by(id: cookies.signed[:user_id])
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

  #ログインしているか判定
  def logged_in?
    !current_user.nil?
  end

   # 永続的セッションを破棄する
   def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end


end
