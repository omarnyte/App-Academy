class Api::SessionsController < ApplicationController
  
  def destroy 
    if current_user.nil?
      render status: 404
    else
      render json: {}
    end
  end
  
  def create
    user = User.find_by_credentials(params[:username],
      params[:password])
    if user 
      login(user)
    else 
      render json: user.errors.full_messages         
    end 
  end
end
