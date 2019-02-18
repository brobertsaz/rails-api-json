# frozen_string_literal: true
module Api
  module V1
    class UsersController < ApplicationController
      def create
        @user = User.new(safe_params)
        if @user.save
          render json: @user, status: :created
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      private

      def safe_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :state_id)
      end
    end
  end
end