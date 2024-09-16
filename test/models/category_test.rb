require "test_helper"

class CategoryTest < ActiveSupport::TestCase
test "should not valid without category name" do
  category = Category.new(description: "some description")
  assert_not category.valid?
end

test "should not valid without category description" do
category = Category.new(name: "some category name")
assert_not category.valid?
end

test "should not valid with category name smaller than 3 characters" do
  category = Category.new(name: "bo", description: "some description")
assert_not category.valid?
end

test "should not valid with category description smaller than 5 characters" do
  category = Category.new(name: "some name category", description: "dsb")
  assert_not category.valid?
end
end
