# frozen_string_literal: true

class Types::VoteType < GraphQL::Schema::Object
  graphql_name 'VoteType'

  field :id, ID, null: false
  field :position, Int, null: false

  field :chamber, Types::ChamberType, null: true
  field :bill, Types::BillType, null: true
  field :member, Types::MemberType, null: true
end
