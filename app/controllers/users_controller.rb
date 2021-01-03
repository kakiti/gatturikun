class UsersController < ApplicationController
  before_action :move_to_login
  def index
    @users = User.order('created_at DESC')
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  private
  
  def move_to_login
    redirect_to new_user_session_path unless user_signed_in?
  end
end
