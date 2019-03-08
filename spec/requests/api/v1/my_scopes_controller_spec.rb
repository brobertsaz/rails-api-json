require 'rails_helper'

RSpec.describe Api::V1::MyScopesController, type: :request do
  let(:user) { create :user }
  let!(:article_posts) { create_list :post, 5 }
  let!(:video_posts) {
    create_list :post, 3, kind: 'video', url: 'https://www.youtube.com/watch?v=xxxxxx'
  }
  let!(:members) {create_list :member, 5}
  let!(:bills) {create_list :bill, 5}

  before do
    user.favorites.create(favoritable: article_posts.last)
    user.favorites.create(favoritable: video_posts.last)
    user.favorites.create(favoritable: bills.last)
    user.favorites.create(favoritable: members.last)
  end
  describe 'GET #show' do
    it 'returns a success response' do
      get '/api/v1/my_scope', headers: auth_headers(user)
      expect(response).to be_successful
      expect(json.dig('bills', 'data').count).to eq 1
      expect(json.dig('members', 'data').count).to eq 1
      expect(json.dig('articles', 'data').count).to eq 1
      expect(json.dig('videos', 'data').count).to eq 1
    end
  end

end