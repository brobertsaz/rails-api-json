require 'rails_helper'

RSpec.describe SigninController, type: :request do
  describe "POST /signin" do
    let(:user) { create :user }
    
    context 'with valid params' do
      let(:user) { create :user }
      let(:valid_params) {{ 
        session: {
          email: user.email,
          password: 'password',
          device: 'ios'
        }
      }}

      before do
        post '/signin', params: valid_params
      end
      
      it 'returns http 422' do  
        expect(response).to have_http_status(200)
      end

      it 'returns a token' do
        expect(json['csrf']).to be
      end
    end
  end

  describe "DELETE /signin" do
    context 'with valid params' do
      let(:user) { create :user }
      let(:valid_params) {{ 
        session: {
          email: user.email,
          password: 'password',
          device: 'ios'
        }
      }}

      before do
        session = JWTSessions::Session.new(payload: {user_id: user.id}, refresh_by_access_allowed: true)
        delete '/signin', params: valid_params
      end
      
      it 'returns http 422' do  
        expect(response).to have_http_status(200)
      end

      it 'returns a token' do
        expect(json['csrf']).to be
      end
    end
  end
end
