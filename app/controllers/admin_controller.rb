class AdminController < ApplicationController
  before_action :admin_authentication
  layout "admin"

  private

  def admin_authentication
    if session[:user_uid] != "MtCygiJ5RAdaTsyR6JVWqnm7wRr1"
      redirect_to login_path
    end
  end
end
