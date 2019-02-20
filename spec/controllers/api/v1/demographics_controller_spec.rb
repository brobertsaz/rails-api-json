require 'rails_helper'

RSpec.describe Api::V1::DemographicsController, type: :controller do
  let(:user) { create :user }
  let!(:race) { create :race}
  let!(:gender) { create :gender}
  let!(:affiliation) { create :affiliation}


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

  before do
    payload = { user_id: user.id }
    session = JWTSessions::Session.new(payload: payload)
    @tokens = session.login
  end

  describe "PUT #update" do
    context 'with valid params' do
      it 'updates demographics' do
        request.cookies[JWTSessions.access_cookie] = @tokens[:access]
        request.headers[JWTSessions.csrf_header] = @tokens[:csrf]
        put :update, params: { id: user.id, user: valid_attributes }
        user.reload
        expect(user.gender.name).to eq valid_attributes[:gender]
        expect(user.race.name).to eq valid_attributes[:race]
        expect(user.affiliation.name).to eq valid_attributes[:affiliation]
        expect(user.voted_in_2016).to eq valid_attributes[:election_2016]
        expect(user.birth_year).to eq valid_attributes[:birth_year]
      end
    end
  end
end