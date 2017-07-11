require 'test_helper'

class AppointmentTest < ActiveSupport::TestCase

  def setup
    @user = users(:michael)
    # This code is not idiomatically correct.
    @appointment = @user.appointments.build(title: "Lorem ipsum")
  end

  test "should be valid" do
    assert @appointment.valid?
  end

  test "user id should be present" do
    @appointment.user_id = nil
    assert_not @appointment.valid?
  end
  
  test "title should be present" do
    @appointment.title = "   "
    assert_not @appointment.valid?
  end

end