class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @appointment = current_user.appointments.build
    end
  end
  
  def help
  end
end
