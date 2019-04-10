# frozen_string_literal: true

class Types::PostType < GraphQL::Schema::Object
  graphql_name 'PostType'

  field :id, ID, null: false
  field :body, String, null: false
  field :source, String, null: false
  field :url, String, null: true
  field :title, String, null: false

end
