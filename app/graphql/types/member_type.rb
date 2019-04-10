# frozen_string_literal: true

class Types::MemberType < GraphQL::Schema::Object
  graphql_name 'MemberType'

  field :id, ID, null: false
  field :name, String, null: false
  field :title, String, null: true
  field :short_title, String, null: true
  field :first_name, String, null: true
  field :middle_name, String, null: true
  field :last_name, String, null: true
  field :suffix, String, null: true
  field :date_of_birth, String, null: true
  field :party, String, null: true
  field :leadership_role, String, null: true
  field :url, String, null: true
  field :office_address, String, null: true
  field :phone, String, null: true
  field :fax, String, null: true
  field :bioguide_id, String, null: true
  field :twitter, String, null: true
  field :facebook, String, null: true
  field :youtube, String, null: true
end
