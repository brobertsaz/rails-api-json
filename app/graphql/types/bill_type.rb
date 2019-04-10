# frozen_string_literal: true

class Types::BillType < GraphQL::Schema::Object
  graphql_name 'BillType'

  field :id, ID, null: false
  field :title, String, null: false
  field :number, String, null: false
  field :summary, String, null: false
  field :full_text_url, String, null: false
end
