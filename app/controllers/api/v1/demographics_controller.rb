# frozen_string_literal: true

class Api::V1::DemographicsController < ApplicationController
  before_action :authenticate_user

  def update
    current_user.gender         = Gender.find_by(name: safe_params[:gender])
    current_user.race           = Race.find_by(name: safe_params[:race])
    current_user.affiliation    = Affiliation.find_by(name: safe_params[:affiliation])
    current_user.voted_in_2016  = safe_params[:election_2016]
    current_user.birth_year     = safe_params[:birth_year]
    if current_user.save(context: :demographic_update)
      render json: { success: true }, status: :ok
    else
      render json: { error: current_user.errors.full_messages.join('. ') }, status: :unprocessable_entity
    end
  end

  private

  def safe_params
    params.require(:user).permit(:gender,
                                 :race,
                                 :affiliation,
                                 :election_2016,
                                 :birth_year)
  end
end
