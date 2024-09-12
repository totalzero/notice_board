require "test_helper"

class UserTest < ActiveSupport::TestCase
test "testing invalid email length parameter" do
@user = User.new(email: "bl", password: "password", password_confirmation: "password")
assert_not @user.valid?
end

test "test invalid password and password confirmation parameters " do
@user = User.new(email: "user@domain.com", password: "password", password_confirmation: "pdfsw")
assert_not @user.valid?
end

test "test unique email parameter" do
@user = User.new(email: "example@domain.com", password: "password", password_digest: "password")
assert_not @user.valid?
end
end
