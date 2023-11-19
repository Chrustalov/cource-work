class PatientRegistrationController < ApplicationController
  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)

    if @patient.save
      redirect_to patient_profiles_path, notice: 'Ви успішно зареєструвались!'
    else
      render 'new'
    end
  end

  private

  def patient_params
    params.require(:patient).permit(:name, :surname, :photo, :birthday,
                                    :residence, :phone_number, :gender, :user_id).merge(user_id: current_user.id)
  end
end
