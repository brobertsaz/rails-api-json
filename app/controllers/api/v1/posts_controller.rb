# frozen_string_literal: true

class Api::V1::PostsController < ApplicationController
  before_action :authenticate_user
  before_action :set_resource, only: %i[favorite show share]

  def index
    posts = if params[:filter] == 'following'
              current_user.favorite_posts.actually_published.ordered
            elsif params[:kind]
              Post.actually_published.ordered.where(kind: params[:kind])
            else
             Post.actually_published.ordered
            end

    render json: PostSerializer.new(posts).serializable_hash
  end

  def show
    render json: PostSerializer.new(@post).serializable_hash
  end

  def favorite
    if current_user.favorites.exists?(favoritable: @post)
      current_user.favorites.find_by(favoritable: @post).destroy
    else
      current_user.favorites.create(favoritable: @post)
    end
  end

  def share; end

  private

  def set_resource
    @post = Post.find(params[:id])
  end
end
