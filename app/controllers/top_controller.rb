class TopController < ApplicationController
  before_action :move_to_login
  def index
  end

  private

  def move_to_login
    redirect_to new_user_session_path unless user_signed_in?
  end
end
