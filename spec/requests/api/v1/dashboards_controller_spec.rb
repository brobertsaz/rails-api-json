require 'rails_helper'

RSpec.describe Api::V1::DashboardsController, type: :request do
  let(:user) { create :user }

  describe 'GET #show' do
    let!(:featured_bills) { create_list :bill, 5, feature_state: 'featured' }
    let!(:unfeatured_bills) { create_list :bill, 4, feature_state: 'unfeatured' }

    it 'returns all bills' do
      get '/api/v1/dashboard', headers: auth_headers(user)
      expect(response).to be_successful
      expect(json.dig('data').count).to eq 9
    end

    it 'returns special bills' do
      get '/api/v1/dashboard', headers: auth_headers(user), params: { filter: 'special' }
      expect(response).to be_successful
      expect(json.dig('data').count).to eq 5
    end

    it 'returns unfeatured bills' do
      get '/api/v1/dashboard', headers: auth_headers(user), params: { filter: 'unfeatured' }
      expect(response).to be_successful
      expect(json.dig('data').count).to eq 4
    end
  end
end