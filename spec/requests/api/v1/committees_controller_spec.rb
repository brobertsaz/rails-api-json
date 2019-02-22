require 'rails_helper'

RSpec.describe Api::V1::CommitteesController, type: :request do
  let(:user) { create :user }
  let(:committee) { create :committee }

  describe 'GET #show' do

    it 'returns a success response' do
      get "/api/v1/committees/#{committee.id}", headers: auth_headers(user)
      expect(response).to be_successful
      expect(response).to match_response_schema('committee')
    end
  end
end