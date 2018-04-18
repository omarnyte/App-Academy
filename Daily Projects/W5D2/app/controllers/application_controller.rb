class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :logged_in?

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def login(user)
    @current_user = user
    session[:session_token] = user.reset_session_token!
  end

  def logout!
    current_user.reset_session_token! if logged_in?
    session[:session_token] = nil
  end

  def logged_in?
    !!current_user
  end

  def require_logged_in
    redirect_to new_session_url unless logged_in?
  end

  def require_moderator
    sub_moderator_id = Sub.find(params[:id]).moderator_id
    unless current_user.id == sub_moderator_id
      flash[:errors] = ['You must be a moderator to do that.']
      redirect_to sub_url(params[:id])
    end
  end
end
