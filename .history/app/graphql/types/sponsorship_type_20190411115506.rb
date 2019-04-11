# frozen_string_literal: true

class Types::SponsorshipType < GraphQL::Schema::Object
  graphql_name 'SponsorshipType'

  field :id, ID, null: false
  field :kind, Int, null: false
  field :bill_id, ID, null: true
  field :member_id, ID, null: true
end
