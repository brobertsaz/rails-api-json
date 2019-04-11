# frozen_string_literal: true

class Types::BillType < GraphQL::Schema::Object
  graphql_name 'BillType'

  field :id, ID, null: false
  field :title, String, null: false
  field :number, String, null: false
  field :summary, String, null: false
  field :full_text_url, String, null: false
  field :introduced_on, GraphQL::Types::ISO8601DateTime, null: true
  field :house_voted_on, GraphQL::Types::ISO8601DateTime, null: true
  field :senate_voted_on, GraphQL::Types::ISO8601DateTime, null: true
  field :enacted_on, GraphQL::Types::ISO8601DateTime, null: true
  field :veteod_on, GraphQL::Types::ISO8601DateTime, null: true
  field :breakdown, String, null: true
  field :digging_deeper, String, null: true
  field :feature_state, Int, null: true
  field :feature_position, Int, null: true
  field :house_result, String, null: true
  field :senate_result, String, null: true
  field :for_left, String, null: true
  field :for_right, String, null: true
  field :slug, String, null: false
  field :is_visible, Boolean, null: true
  field :topic, TopicType, null: true
  field :congress, CongressType, null: false

  field :sponsors, [SponsorType], null: false
end
