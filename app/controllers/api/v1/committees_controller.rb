# frozen_string_literal: true

class Api::V1::CommitteesController < ApplicationController
  before_action :authorize_access_request!

  def show
    committee = Committee.find(params[:id])
    render json: CommitteeSerializer.new(committee).serializable_hash
  end
end