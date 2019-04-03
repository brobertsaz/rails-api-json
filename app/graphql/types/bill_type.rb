# frozen_string_literal: true

module Types
  class BillType < BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :number, String, null: false
    field :summary, String, null: false
    field :fullTextUrl, String, null: false

    # def self.authorized?(object, context)
    #   binding.pry
    #   # super && (object.to_friend == context[:viewer] || object.from_friend == context[:viewer])
    # end
  end
end
