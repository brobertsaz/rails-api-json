require 'rails_helper'

RSpec.describe Api::V1::BillsController, type: :controller do
  let(:user) { create :user }

  before do
    payload = { user_id: user.id }
    session = JWTSessions::Session.new(payload: payload)
    @tokens = session.login
    request.cookies[JWTSessions.access_cookie] = @tokens[:access]
    request.headers[JWTSessions.csrf_header] = @tokens[:csrf]
  end

  describe 'GET #index' do
    let!(:bills) { create_list :bill, 5}

    it 'returns successful response' do
      get :index
      expect(response).to be_successful
      expect(json.dig('data').count).to eq 5
    end

    it 'filters favorites' do
      user.favorites.create(favoritable: bills.last)
      get :index, params: { filter: 'following' }
      expect(response).to be_successful
      expect(json.dig('data').count).to eq 1
    end
  end

  describe 'GET #show' do
    let(:bill) { create :bill }

    it 'returns a success response' do
      request.cookies[JWTSessions.access_cookie] = @tokens[:access]
      request.headers[JWTSessions.csrf_header] = @tokens[:csrf]
      get :show, params: { id: bill.id }
      expect(response).to be_successful
    end
  end

  describe 'POST #favorite' do
    let(:bill) { create :bill }

    before do
      request.cookies[JWTSessions.access_cookie] = @tokens[:access]
      request.headers[JWTSessions.csrf_header] = @tokens[:csrf]
    end

    it 'favorites a bill' do
      post :favorite, params: { id: bill.id }
      expect(response).to be_successful
      expect(user.favorites.count).to eq 1
    end

    it 'unfavorites a bill' do
      user.favorites.create(favoritable: bill)
      post :favorite, params: { id: bill.id }
      expect(response).to be_successful
      expect(user.favorites.count).to eq 0
    end
  end

  describe 'GET #cosponsors' do
    let(:bill) { create :bill }
    let(:member) { create :member }
    let!(:cosponsor) { create :sponsorship, kind: 'cosponsor', bill: bill, member: member }

    it 'returns cosponsors' do
      request.cookies[JWTSessions.access_cookie] = @tokens[:access]
      request.headers[JWTSessions.csrf_header] = @tokens[:csrf]
      get :cosponsors, params: { id: bill.id }
      expect(response).to be_successful
      expect(json.dig('data').count).to eq 1
    end
  end
end