class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # helper_method makes function define here available to be access in view
  # coz by default function declare here only availbale in controller only
  helper_method :current_user, :logged_in?

  def current_user
    # `return user` if there is a user_id stored in browser session
    # ||= means that if @current_user already exist do not hit DB again
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    # !!current_user: will `return true` if we have current user
    # same like: if current_user == true (user logged in)
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:danger] = "You must be logged in to perform that action"
      redirect_to root_path
    end
  end
end
