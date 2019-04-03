# frozen_string_literal: true

class Api::V1::MembersController < ApplicationController
  before_action :authenticate_user
  before_action :set_resource, only: %i[show favorite]

  def index
    members = if params[:filter] == 'following'
                current_user.favorite_members.in_office.ordered
              elsif params[:filter] == 'state'
                Member.where(state: current_user.state).in_office.ordered
              else
                Member.ordered.in_office
            end

    render json: MemberSerializer.new(members).serializable_hash
  end

  def show
    render json: MemberSerializer.new(@member).serializable_hash
  end

  def favorite
    if current_user.favorites.exists?(favoritable: @member)
      current_user.favorites.find_by(favoritable: @member).destroy
    else
      current_user.favorites.create(favoritable: @member)
    end
  end

  private

  def set_resource
    @member = Member.find(params[:id])
  end
end
