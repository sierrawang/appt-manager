module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = "Appointment Manager"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
  
  def time_diff
    flash_messages = []
    current_user.appointments.each do |appt|
      unless appt.appt_time.nil?
        diff = appt.appt_time - Time.now
        diff = diff/60
        if diff < 60 && diff > 0
          flash_messages << "Appointment in " + diff.to_s + " minutes"
        end
      end
    end
    flash_messages
  end
end
