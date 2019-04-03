class Api::V1::BillsController < ApplicationController
  before_action :authenticate_user
  before_action :set_resource, only: %i[show favorite cosponsors]

  def index
    bills = if params[:filter] == 'following'
              current_user.favorite_bills
            else
              Bill.visible
            end

    render json: BillSerializer.new(bills.ordered).serializable_hash
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

  def set_resource
    @bill = Bill.find(params[:id])
  end
end
