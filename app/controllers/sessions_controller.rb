class SessionsController < ApplicationController
  def create
    if (user = User.find_by(email: safe_params[:email].try(:downcase))) && user.authenticate(safe_params[:password])
      token = user.app_tokens.where(kind: safe_params[:device]).first_or_create!
      render json: { token: token.token }, head: :ok
    else
      head :unprocessable_entity
    end
  end

  private 
  
  def safe_params
    params.require(:session).permit(:email, :password, :device)
  end
end
