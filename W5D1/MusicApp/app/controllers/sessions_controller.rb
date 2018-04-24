class SessionsController < ApplicationController

  def new
    render :new
  end

  #logging in
  def create
    user = User.find_by_credentials(
    params[:user][:email],
    params[:user][:password]
    )

    if user.nil?
      flash.now[:errors] = ["Incorrect username and/or password"]
      render :new
    else
      login!(user)
      redirect_to user_url(user)
      # session_token = User.reset_session_token!
    end
  end

  #logging out
  def destroy
    current_user.reset_session_token!
    #session_token[:session_token] = nil
    redirect_to new_session_url
  end
end
