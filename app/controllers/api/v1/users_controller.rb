# frozen_string_literal: true

class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(safe_params)
    if user.save
      auth_token = Knock::AuthToken.new payload: { sub: user.id }
      render json: auth_token, status: :created
    else
      render json: { error: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def safe_params
    params.require(:user).permit(:name,
                                 :email,
                                 :password,
                                 :password_confirmation,
                                 :state_id)
  end
end
