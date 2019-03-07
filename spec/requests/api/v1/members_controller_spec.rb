require 'rails_helper'

RSpec.describe Api::V1::MembersController, type: :request do
  let(:state) { create :state }
  let(:member_state) { create :state, abbreviation: 'ZZ' }
  let(:user) { create :user, state: state }
  let(:bill) { create :bill }


  describe 'GET #index' do
    let!(:members) { create_list :member, 5, state: member_state }

    it 'returns all members' do
      get '/api/v1/members', headers: auth_headers(user)
      expect(response).to be_successful
      expect(json.dig('data').count).to eq 5
    end

    it 'filters by favorites' do
      user.favorites.create(favoritable: members.last)
      get '/api/v1/members', headers: auth_headers(user),
                             params: { filter: 'following' }
      expect(response).to be_successful
      expect(json.dig('data').count).to eq 1
    end

    it 'filters by state' do
      members.last.update state: state
      get '/api/v1/members', headers: auth_headers(user),
                             params: { filter: 'state' }
      expect(response).to be_successful
      expect(json.dig('data').count).to eq 1
    end
  end

  describe 'GET #show' do
    let(:member) { create :member }
    let!(:sponsorship) { create :sponsorship, member: member, bill: bill }
    let!(:vote) { create :vote, bill: bill, member: member }

    it 'returns a success response' do
      get "/api/v1/members/#{member.id}", headers: auth_headers(user)
      expect(response).to be_successful
      expect(json.dig('data', 'attributes', 'bills')).to be
      expect(json.dig('data', 'attributes', 'votes')).to be
    end
  end

  describe 'POST #favorite' do
    let(:member) { create :member }

    it 'favorites a member' do
      post "/api/v1/members/#{member.id}/favorite", headers: auth_headers(user)
      expect(response).to be_successful
      expect(user.favorites.count).to eq 1
    end

    it 'unfavorites a bill' do
      user.favorites.create(favoritable: member)
      post "/api/v1/members/#{member.id}/favorite", headers: auth_headers(user)
      expect(response).to be_successful
      expect(user.favorites.count).to eq 0
    end
  end
end