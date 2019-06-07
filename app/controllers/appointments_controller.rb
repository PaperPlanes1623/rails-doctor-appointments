class AppointmentsController < ApplicationController
  before_action :set_doctor
  before_action :set_appointment, only: [:show, :edit, :destroy, :update]
  def index
    @appointments = @doctor.appointments
  end

  def new
    @appointment = @doctor.appointments.new
  end

  def show
  end

  def edit
  end

  def create
    @appointment = @doctor.appointments.new(appointment_params)
    if @appointment.save
      redirect_to doctor_appointments_path
    else
      render :new
    end
  end

  def update
    if @appointment.update(appointment_params)
      redirect_to doctor_appointments_path
    else
      render :edit
    end
  end

  def destroy
    @doctor.appointments.destroy
    redirect_to doctor_appointments_path
  end

  private

  def appointment_params
    params.require(:appointment).permit(:date, :user_id, :doctor_id)
  end

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def set_doctor
    @doctor = Doctor.find(params[:doctor_id])
  end
end
