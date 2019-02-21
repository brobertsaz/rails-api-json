# frozen_string_literal: true

class Api::V1::CommitteesController < ApplicationController
  before_action :authorize_access_request!

  def show
    @committee = Committee.find(params[:id])
    # @bills     = @committee.bills.visible.order('introduced_on desc')
    render json: @committee
  end
end