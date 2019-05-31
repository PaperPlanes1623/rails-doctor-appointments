class DoctorsController < ApplicationController
  before_action :set_doctor, only: [:show, :edit, :delete]
  def index
    @doctors = Doctor.all
  end

  def new
    @doctor = Doctor.new
  end

  def show
  end

  def edit
  end

  def create
    @doctor = Doctor.new(doctor_params)
    if @doctor.save
      redirect_to @doctor
    else
      render :new
    end
  end

  def delete
    @doctor.destroy
  end

  private

  def doctor_params
    params.require(:doctor).permit(:name)
  end

  def set_doctor
    @doctor = Doctor.find(params[:id])
  end
end
