require 'rails_helper'

RSpec.describe Api::V1::PostsController, type: :request do
  let(:user) { create :user }

  describe 'GET #index' do
    let!(:article_posts) { create_list :post, 5 }
    let!(:video_posts) {
      create_list :post, 3,
                  kind: 'video',
                  url: 'https://www.youtube.com/watch?v=xxxxxx'
    }

    it 'returns all posts' do
      get '/api/v1/posts', headers: auth_headers(user)
      expect(response).to be_successful
      expect(json.dig('data').count).to eq 8
    end

    it 'filters favorites' do
      user.favorites.create(favoritable: article_posts.last)
      get '/api/v1/posts', headers: auth_headers(user),
                           params: { filter: 'following' }
      expect(response).to be_successful
      expect(json.dig('data').count).to eq 1
    end

    it 'filters articles' do
      get '/api/v1/posts', headers: auth_headers(user),
                           params: { kind: 'article' }
      expect(response).to be_successful

      expect(json.dig('data').count).to eq 5
    end

    it 'filters videos' do
      get '/api/v1/posts', headers: auth_headers(user),
                           params: { kind: 'video' }
      expect(response).to be_successful
      expect(json.dig('data').count).to eq 3
    end
  end

  describe 'GET #show' do
    let(:article_post) { create :post }

    it 'returns a success response' do
      get "/api/v1/posts/#{article_post.id}", headers: auth_headers(user)
      expect(response).to be_successful
    end
  end

  describe 'POST #favorite' do
    let(:article_post) { create :post }

    it 'favorites a post' do
      expect {
        post "/api/v1/posts/#{article_post.id}/favorite", headers: auth_headers(user)
      }.to change { user.favorites.count }.by(1)
      expect(response).to be_successful

    end

    it 'unfavorites a post' do
      user.favorites.create(favoritable: article_post)
      expect {
        post "/api/v1/posts/#{article_post.id}/favorite", headers: auth_headers(user)
      }.to change { user.favorites.count }.by(-1)
      expect(response).to be_successful

    end
  end

end