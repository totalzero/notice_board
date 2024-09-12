module UsersHelper
  def user_login(user)
    session[:current_user] = user.id
  end
end
