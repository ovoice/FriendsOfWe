require 'test_helper'

class NotificationsTest < ActionMailer::TestCase
  test "password_reset_instructions" do
    @expected.subject = 'Notifications#password_reset_instructions'
    @expected.body    = read_fixture('password_reset_instructions')
    @expected.date    = Time.now

    assert_equal @expected.encoded, Notifications.create_password_reset_instructions(@expected.date).encoded
  end

end
