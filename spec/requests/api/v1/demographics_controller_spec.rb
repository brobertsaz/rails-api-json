require 'rails_helper'

RSpec.describe Api::V1::DemographicsController, type: :request do
  let(:user) { create :user }
  let!(:race) { create :race }
  let!(:gender) { create :gender }
  let!(:affiliation) { create :affiliation }


  let(:valid_attributes) {
    {
      gender: 'Woman',
      race: 'Other',
      affiliation: 'Democrat',
      election_2016: true,
      birth_year: 1995
    }
  }

  let(:invalid_attributes) {
    {
      election_2016: true,
      birth_year: 1995
    }
  }

  describe "PUT #update" do
    context 'with valid params' do
      it 'updates demographics' do
        put '/api/v1/demographics', params: { id: user.id, user: valid_attributes }, headers: auth_headers(user)
        user.reload
        expect(user.gender.name).to eq valid_attributes[:gender]
        expect(user.race.name).to eq valid_attributes[:race]
        expect(user.affiliation.name).to eq valid_attributes[:affiliation]
        expect(user.voted_in_2016).to eq valid_attributes[:election_2016]
        expect(user.birth_year).to eq valid_attributes[:birth_year]
      end

      it 'renders a success JSON response' do
        put '/api/v1/demographics', params: { id: user.id, user: valid_attributes }, headers: auth_headers(user)
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors' do
        put '/api/v1/demographics', params: { id: user.id, user: invalid_attributes }, headers: auth_headers(user)
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end
end