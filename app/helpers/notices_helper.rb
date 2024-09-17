module NoticesHelper
def notice_owner?(user, notice)
    user == notice.user
end
end
