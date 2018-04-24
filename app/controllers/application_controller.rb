class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  helper_method :current_user 
  
  def current_user
    user = User.find_by(session_token: session[:session_token]);
    if user && User.find_by_credentials(user[username])
      @current_user ||= user
    end
  end
  
  def login(user)
    session[:session_token] = user.reset_session_token  
    @current_user = user; 
  end 
  
  def logout
    current_user.reset_session_token
    session[:session_token] = nil
  end 
  
end
