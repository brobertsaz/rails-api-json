require 'rails_helper'

RSpec.describe Api::V1::SessionsController, type: :request do
  describe "POST /sessions" do
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
        post api_v1_sessions_path, params: valid_params
      end
      
      it 'returns http 422' do  
        expect(response).to have_http_status(200)
      end

      it 'returns a token' do
        expect(json['token']).to be
      end
    end
  end
end
