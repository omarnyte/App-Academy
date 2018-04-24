class Api::UsersController < ApplicationController
  
  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      render :show 
    end
  end
  
  def new
    
  end
  
  private
   
  def user_params
    params.permit(:username, :password)
  end
end
