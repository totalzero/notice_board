require "test_helper"
require "minitest/autorun"

class UsersControllerTest < ActionDispatch::IntegrationTest
test "should get login page" do
  get "/login"
  assert_response :success
  assert_template :login_form
end

test "should get dashboard page when user logged in" do
post login_user_url, params: {email: "example@domain.com", password: "password"}
assert_redirected_to dashboard_path(User.find_by(email: "example@domain.com"))
follow_redirect!
assert_response :success
end

test "should alert when get invalid login parameters" do
  post login_user_url, params: {email: "example@domain.com", password: "passwo"}
  assert_not flash[:alert].nil?
end

test "should get registration page" do
get registration_url
assert_response :success
assert_template :new
end

test "should errors when get invalid registration parameters" do
post registration_user_url, params: {user: {email: "cbd", password: ""}}
assert_response :unprocessable_entity
assert_template :new
assert_select "ul"
end

test "should redirect to dashboard page after registration" do
  password = "password"
  user = User.new(email: "example@domain.com", password: password)
  user.id = 1
user.stub(:save, true) do
  User.stub(:new, user) do
post registration_user_url, params: {user: {email: "test@domain.com", password: password, password_confirmation: password}}
assert_response :redirect
assert_redirected_to dashboard_path(user)
end
end
end

test "should get login page if get dashboard with not logged user" do
  get dashboard_url(User.first)
  assert_response :redirect
  assert_redirected_to root_path
    assert flash[:alert], "you must login"
end
end
