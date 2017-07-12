class AppointmentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :edit, :destroy, :update]
  before_action :correct_user,   only: [:create, :edit, :destroy, :update]

  def create
    @appointment = current_user.appointments.build(appointment_params)
    if @appointment.save
      flash[:success] = "Appointment created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end
  
  def edit
    @appointment = Appointment.find(params[:id])
  end

  def destroy
    @appointment.destroy
    flash[:success] = "Appointment deleted"
    redirect_to request.referrer || root_url
  end
  
  def update
    @appointment.update_attributes(appointment_params)
    flash[:success] = "Appointment updated!"
    redirect_to request.referrer || root_url
  end
  
  private

    def appointment_params
      params.require(:appointment).permit(:title, :appt_time)
    end
    
    def correct_user
      @appointment = current_user.appointments.find_by(id: params[:id])
      redirect_to root_url if @appointment.nil?
    end
end
