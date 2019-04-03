module Types
  class QueryType < BaseObject
    field :all_bills, [BillType], null: false

    def all_bills
      Bill.all
    end

    field :bill, BillType, null: false do
      argument :id, ID, required: true
    end

    def bill(id:)
      Bill.find(id)
    end
  end
end
