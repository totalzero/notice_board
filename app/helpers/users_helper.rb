module UsersHelper
  def user_login(user)
    session[:current_user] = user.id
  end

  def current_user
    User.find(session[:current_user])
end

def user_logged?
! session[:current_user].nil?
end

def user_logout
  session[:current_user] = nil
end
end
