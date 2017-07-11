require 'test_helper'

class AppointmentsControllerTest < ActionDispatch::IntegrationTest
 def setup
    @appointment = appointments(:orange)
 end

  test "should redirect create when not logged in" do
    assert_no_difference 'Appointment.count' do
      post appointment_path, params: { appointment: { title: "Lorem ipsum" } }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Appointment.count' do
      delete appointment_path(@appointment)
    end
    assert_redirected_to login_url
  end
end
