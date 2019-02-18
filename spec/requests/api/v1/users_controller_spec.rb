require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :request do
  describe "POST /users" do
    context 'with valid params' do
      let(:valid_params) {{ user: {
        name: Faker::Name.name,
        email: Faker::Internet.email,
        password: 'password',
        password_confirmation: 'password'}
      }}

      before do
        post api_v1_users_path, params: valid_params
      end
      
      it 'returns http 201' do  
        expect(response).to have_http_status(201)
      end

      it 'creates a user' do
        expect(json['name']).to eq valid_params[:user][:name]
        expect(json['email']).to eq valid_params[:user][:email]
      end
    end

    context 'with invalid params' do
      let(:invalid_params) {{ 
        user: {
          name: Faker::Name.name
        }
      }}

      before do
        post api_v1_users_path, params: invalid_params
      end
      
      it 'returns http 422' do  
        expect(response).to have_http_status(422)
        expect(response.body).to match("{\"password\":[\"can't be blank\"],\"email\":[\"can't be blank\",\"is not an email\"]}")
      end

      it 'creates a user' do
        expect(json['name']).to_not be
        expect(json['email']).to eq(["can't be blank", "is not an email"])
      end
    end
  end
end
