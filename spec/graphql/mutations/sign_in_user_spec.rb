require 'spec_helper'

Rspec.describe Mutations::SignInUser, type: :request do
  let!(:user) { create :user }

  it 'signs in valid user' do
    query =
        <<~GQL
          mutation {
            signinUser(
              email: {
                email: "#{user.email}", 
                password: "#{user.password}"
              }
            ) {
              token
              user {
                id
              }
            }
          }
      GQL

    post '/api/graphql', params: { query: query }
    expect(response).to be_successful
    expect(json.dig('data','signinUser','token')).to be
    expect(json.dig('data','signinUser','user','id')).to eq user.id.to_s
  end


  it 'fails with invalid email' do
    query =
        <<~GQL
          mutation {
            signinUser(
              email: {
                email: "bill@bill.com", 
                password: "#{user.password}"
              }
            ) {
              token
              user {
                id
              }
            }
          }
    GQL

    post '/api/graphql', params: { query: query }
    expect(response).to be_successful
    expect(json.dig('data','signinUser')).to be nil
  end


  it 'fails with invalid password' do
    query =
        <<~GQL
          mutation {
            signinUser(
              email: {
                email: "#{user.email}", 
                password: "qwerty"
              }
            ) {
              token
              user {
                id
              }
            }
          }
    GQL

    post '/api/graphql', params: { query: query }
    expect(response).to be_successful
    expect(json.dig('data','signinUser')).to be nil
  end
end