require 'spec_helper'

Rspec.describe Mutations::CreateUser, type: :request do

  it 'creates a new user' do
    query =
        <<~GQL
          mutation {
            createUser(
              name: "Test User",
              authProvider: {
                email: {
                  email: "test@example.com",
                  password: "123456"
                }
              }
            ) {
                id
                name
                email
              }
          }
    GQL

    expected_response =
        {
            data: {
              createUser: {
                    id: "1",
                    name: "Test User",
                    email: "test@example.com"
                }
            }
        }

    post '/api/graphql', params: { query: query }
    expect(response).to be_successful
    expect(json).to include_json(expected_response)
    expect(User.count).to eq 1
  end
end