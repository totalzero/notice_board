require "test_helper"

class NoticeTest < ActiveSupport::TestCase
test "should not valid when title is shorter than 3" do
notice = Notice.new(title: "sm", body: "this is a example description")
assert_not notice.valid?
end

test "should not valid when notice body is shorter than 12 characters" do
notice = Notice.new(title: "some notice title", body: "body")
assert_not notice.valid?
end

test "should not valid when notice title is empty" do
  notice = Notice.new(title: "", body: "this is a example notice body content")
  assert_not notice.valid?
end

test "should not valid when notice body is empty" do
  notice = Notice.new(title: "example notice title", body: "")
assert_not notice.valid?
end
end
