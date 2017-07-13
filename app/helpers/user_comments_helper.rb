module UserCommentsHelper
  def available_appts
    appts = []
    Appointment.all.each do |appt|
      appts << appt.id
    end
    appts
  end
end
