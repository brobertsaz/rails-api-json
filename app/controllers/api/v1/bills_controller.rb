class Api::V1::BillsController < ApplicationController
  before_action :authenticate_user
  before_action :set_resource, only: %i[show favorite cosponsors]
  # after_action :track_action

  def index
    @query = if params[:filter] == 'following'
               current_user.favorite_bills.ransack(params[:q])
             else
               Bill.visible.ransack(params[:q])
             end

    @query.sorts = ['introduced_on desc'] if @query.sorts.empty?
    @bills = @query.result

    render json: BillSerializer.new(@bills).serializable_hash
  end

  def show
    render json: BillSerializer.new(@bill).serializable_hash
  end

  def favorite
    if current_user.favorites.exists?(favoritable: @bill)
      current_user.favorites.find_by(favoritable: @bill).destroy
    else
      current_user.favorites.create(favoritable: @bill)
    end
  end

  def cosponsors
    @cosponsors = @bill.cosponsors.ordered

    render json: MemberSerializer.new(@cosponsors).serializable_hash
  end

  private

  # def track_action
  #   ahoy.authenticate(current_user) if current_user
  #   ahoy.track "Bills #{action_name}", request.filtered_parameters
  # end

  def set_resource
    @bill = Bill.friendly.find(params[:id])
  end
end
