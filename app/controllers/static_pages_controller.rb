class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @appointment = current_user.appointments.build if logged_in?
    end
  end
  
  def help
  end
end
