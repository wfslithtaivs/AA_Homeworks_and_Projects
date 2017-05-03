class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def log_in_user!(user)
    user.reset_session_token!
    session[:session_token] = user.session_token
  end

  def logged_in?
    current_user
  end

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def log_out!
    session[:session_token] = User.generate_session_token
  end

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to new_user_url
    end
  end

end
