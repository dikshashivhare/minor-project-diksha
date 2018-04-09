require 'test_helper'

class NotificationMailerTest < ActionMailer::TestCase
  test "admin_notification" do
    mail = NotificationMailer.admin_notification
    assert_equal "Admin notification", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "employeer_notification" do
    mail = NotificationMailer.employeer_notification
    assert_equal "Employeer notification", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
