require 'rails_helper'

RSpec.describe SigninController, type: :controller do
  describe "POST #create" do
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
      let(:invalid_params) {{ 
        session: {
          email: user.email,
          password: 'invalid',
          device: 'ios'
        }
      }}

      it 'returns http success' do 
        post :create, params: valid_params 
        expect(response).to have_http_status(200)
        expect(response).to be_successful
        expect(json.keys).to eq ['csrf']
        expect(response.cookies[JWTSessions.access_cookie]).to be_present
      end

      it 'returns unauthorized for invalid params' do
        post :create, params: invalid_params 
        expect(response).to have_http_status(401)
      end
    end
  end
end
