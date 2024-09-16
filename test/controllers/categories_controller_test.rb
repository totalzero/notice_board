require "test_helper"
require "minitest/autorun"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
test "should get new page " do
get new_category_url
assert_response :success
assert_template :new
end
end
