# frozen_string_literal: true

class Api::V1::DashboardsController < ApplicationController
  before_action :authenticate_user

  def show
    bills = if params[:filter] == 'special'
              Bill.special
            elsif params[:filter] == 'unfeatured'
              Bill.unfeatured.visible
            else
              Bill.visible
            end

    render json: BillSerializer.new(bills).serializable_hash
  end
end
