require 'spec_helper'

describe Types::AffiliationType do
  it 'includes the expected fields' do
    expect(described_class.fields.keys).to match_array(
      %w[
        id
        name
        title
        short_title
        first_name
        middle_name
        last_name
        suffix
        date_of_birth
        party
        leadership_role
        url
        office_address
        phone
        fax
        bioguide_id
        twitter
        facebook
        youtube
      ]
    )
  end

  it { expect(described_class.fields['id'].type.to_type_signature).to eq('ID!') }
  it { expect(described_class.fields['name'].type.to_type_signature).to eq('String!') }
  it { expect(described_class.fields['title'].type.to_type_signature).to eq('String') }
  it { expect(described_class.fields['short_title'].type.to_type_signature).to eq('String') }
  it { expect(described_class.fields['first_name'].type.to_type_signature).to eq('String') }
  it { expect(described_class.fields['middle_name'].type.to_type_signature).to eq('String') }
  it { expect(described_class.fields['last_name'].type.to_type_signature).to eq('String') }
  it { expect(described_class.fields['suffix'].type.to_type_signature).to eq('String') }
  it { expect(described_class.fields['date_of_birth'].type.to_type_signature).to eq('String') }
  it { expect(described_class.fields['party'].type.to_type_signature).to eq('String') }
  it { expect(described_class.fields['leadership_role'].type.to_type_signature).to eq('String') }
  it { expect(described_class.fields['url'].type.to_type_signature).to eq('String') }
  it { expect(described_class.fields['office_address'].type.to_type_signature).to eq('String') }
  it { expect(described_class.fields['phone'].type.to_type_signature).to eq('String') }
  it { expect(described_class.fields['fax'].type.to_type_signature).to eq('String') }
  it { expect(described_class.fields['bioguide_id'].type.to_type_signature).to eq('String') }
  it { expect(described_class.fields['twitter'].type.to_type_signature).to eq('String') }
  it { expect(described_class.fields['facebook'].type.to_type_signature).to eq('String') }
  it { expect(described_class.fields['youtube'].type.to_type_signature).to eq('String') }
end
