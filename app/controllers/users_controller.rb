class UsersController < ApplicationController
include UsersHelper

def new
@user = User.new
end

def create
@user = User.new(user_params)
if @user.save
  user_login(@user)
redirect_to dashboard_path(@user)
else
  render :new, status: :unprocessable_entity
end
end

def login_form
  @user = User.new
end

def login
  @user = User.find_by(email: params[:email])
  if @user&.authenticate(params[:password])
user_login(@user)
redirect_to dashboard_path(@user)
  else
    flash.now[:alert] = "invalid login parameters"
render :login_form, status: :unprocessable_entity
  end
end

def dashboard
@user = User.find(params[:id])
end

private
def user_params
params.require(:user).permit([:email, :password, :password_confirmation])
end

end
