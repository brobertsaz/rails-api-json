require 'spec_helper'

describe Types::BillType do
  it 'includes the expected fields' do
    expect(described_class.fields.keys).to match_array(
      %w[
        id
        fullTextUrl
        number
        summary
        title
      ]
    )
  end

  it { expect(described_class.fields['id'].type.to_type_signature).to eq('ID!') }
  it { expect(described_class.fields['fullTextUrl'].type.to_type_signature).to eq('String!') }
  it { expect(described_class.fields['number'].type.to_type_signature).to eq('String!') }
  it { expect(described_class.fields['summary'].type.to_type_signature).to eq('String!') }
  it { expect(described_class.fields['title'].type.to_type_signature).to eq('String!') }
end
