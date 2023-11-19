class Patient::DoctorsController < Patient::ApplicationController
  def index
    @doctors = Doctor.all
  end
end
