require 'test_helper'

class NotifierTest < ActionMailer::TestCase
  test "checked_in" do
    mail = Notifier.checked_in(Ride.find(1))
    assert_equal "Checked in", mail.subject
    assert_equal ["ppassa@gmail.com"], mail.to
    assert_equal ["grandride@ppassa.com"], mail.from
  end

  test "checked_out" do
    mail = Notifier.checked_out
    assert_equal "Checked out", mail.subject
    assert_equal ["ppassa@gmail.com"], mail.to
    assert_equal ["grandride@ppassa.com"], mail.from
  end

end
