require 'rails_helper'

RSpec.describe Api::V1::BillsController, type: :request do
  let(:user) { create :user }


  describe 'GET #index' do
    let!(:bills) { create_list :bill, 5 }

    it 'returns successful response' do
      get '/api/v1/bills', headers: auth_headers(user)
      expect(response).to be_successful
      expect(json.dig('data').count).to eq 5
    end

    it 'filters favorites' do
      user.favorites.create(favoritable: bills.last)
      get '/api/v1/bills', headers: auth_headers(user), params: { filter: 'following' }
      expect(response).to be_successful
      expect(json.dig('data').count).to eq 1
    end
  end

  describe 'GET #show' do
    let(:bill) { create :bill }

    it 'returns a success response' do
      get "/api/v1/bills/#{bill.id}", headers: auth_headers(user)
      expect(response).to be_successful
    end
  end

  describe 'POST #favorite' do
    let(:bill) { create :bill }

    it 'favorites a bill' do
      post "/api/v1/bills/#{bill.id}/favorite", headers: auth_headers(user)
      expect(response).to be_successful
      expect(user.favorites.count).to eq 1
    end

    it 'unfavorites a bill' do
      user.favorites.create(favoritable: bill)
      post "/api/v1/bills/#{bill.id}/favorite", headers: auth_headers(user)
      expect(response).to be_successful
      expect(user.favorites.count).to eq 0
    end
  end

  describe 'GET #cosponsors' do
    let(:bill) { create :bill }
    let(:member) { create :member }
    let!(:cosponsor) { create :sponsorship, kind: 'cosponsor', bill: bill, member: member }

    it 'returns cosponsors' do
      get "/api/v1/bills/#{bill.id}/cosponsors", headers: auth_headers(user)
      expect(response).to be_successful
      expect(json.dig('data').count).to eq 1
    end
  end
end