# frozen_string_literal: true

class Api::V1::MyScopesController < ApplicationController
  before_action :authenticate_user

  def show
    members  = current_user.favorite_members.ordered
    bills    = current_user.favorite_bills.order('introduced_on desc')
    videos   = current_user.favorite_posts.where(kind: 'video')
    articles = current_user.favorite_posts.where(kind: 'article')

    render json: {
      members: MemberSerializer.new(members).serializable_hash,
      bills: BillSerializer.new(bills).serializable_hash,
      videos: PostSerializer.new(videos).serializable_hash,
      articles: PostSerializer.new(articles).serializable_hash
    }
  end
end
