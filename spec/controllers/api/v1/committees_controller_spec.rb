require 'rails_helper'

RSpec.describe Api::V1::CommitteesController, type: :controller do
  let(:user) { create :user }

  before do
    payload = { user_id: user.id }
    session = JWTSessions::Session.new(payload: payload)
    @tokens = session.login
    request.cookies[JWTSessions.access_cookie] = @tokens[:access]
    request.headers[JWTSessions.csrf_header] = @tokens[:csrf]
  end

  describe 'GET #show' do
    let(:committee) { create :committee }

    it 'returns a success response' do
      request.cookies[JWTSessions.access_cookie] = @tokens[:access]
      request.headers[JWTSessions.csrf_header] = @tokens[:csrf]
      get :show, params: { id: committee.id }
      expect(response).to be_successful
    end
  end
end