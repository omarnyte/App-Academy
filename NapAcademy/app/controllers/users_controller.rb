class UsersController < ApplicationController
  def new

  end

  def create
    @user = User.new
    if @user.save
      redirect_to new_session_url
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end
end
