require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :request do
  describe "POST #create" do
    context 'with valid params' do
      let(:valid_params) {
        { user: {
          name: Faker::Name.name,
          email: Faker::Internet.email,
          password: 'password',
          password_confirmation: 'password'} }
      }

      it 'returns http success' do
        post '/api/v1/users', params: valid_params
        expect(response).to be_successful
        expect(response).to have_http_status(201)
        expect(json.keys).to eq ['jwt']
      end

      it 'creates a user' do
        expect do
          post '/api/v1/users', params: valid_params
        end.to change(User, :count).by(1)
      end
    end

    context 'with invalid params' do
      let(:invalid_params) {
        {
          user: {
            name: Faker::Name.name
          }
        }}

      it 'returns http 422' do
        post '/api/v1/users', params: invalid_params
        expect(response).to have_http_status(422)
        expect(response.body).to match("{\"error\":[\"Password can't be blank\",\"Email can't be blank\",\"Email is not an email\"]}")
      end

      it 'does not create a user' do
        expect do
          post '/api/v1/users', params: invalid_params
        end.to change(User, :count).by(0)
      end
    end
  end
end
