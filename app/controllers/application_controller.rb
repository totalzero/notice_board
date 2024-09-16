class ApplicationController < ActionController::Base
  include UsersHelper

  protected
  def required_login
    unless user_logged?
      flash.now[:alert] = "you must login"
        redirect_to root_path
    end
  end
end
