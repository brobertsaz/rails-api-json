require 'spec_helper'

Rspec.describe Types::BillType, type: :request do
  let!(:bills) { create_list :bill, 5 }

  it 'gets list of all_bills' do
    query =
      <<~GQL
          query {
            allBills {
              id
              number
            }
          }
      GQL

    post '/graphql', params: { query: query }
    expect(response).to be_successful
    data = json.dig('data', 'allBills')
    expect(data.count).to eq 5
  end

  it 'gets featured_bills' do
    Bill.last.update(feature_state: 'featured')

    query =
      <<~GQL
          query {
            featuredBills {
              id
              number
            }
          }
      GQL

    post '/graphql', params: { query: query }
    expect(response).to be_successful
    data = json.dig('data', 'featuredBills')
    expect(data.count).to eq Bill.special.count
  end

  it 'gets bills'

  it 'gets a bill' do
    query =
      <<~GQL
          query {
            bill (id: #{Bill.first.id}) {
              id
              number
            }
          }
      GQL

    post '/graphql', params: { query: query }
    expect(response).to be_successful
    data = json.dig('data', 'bill')
    expect(data['id']).to eq Bill.first.id.to_s
    expect(data['number']).to eq Bill.first.number
  end

end
