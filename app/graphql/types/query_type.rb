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

    field :all_members, [MemberType], null: false

    def all_members
      Member.all
    end

    field :member, MemberType, null: false do
      argument :id, ID, required: true
    end

    def member(id:)
      Member.find(id)
    end

    field :all_posts, [PostType], null: false

    def all_posts
      Post.all
    end

    field :post, PostType, null: false do
      argument :id, ID, required: true
    end

    def post(id:)
      Post.find(id)
    end

    field :committee, CommitteeType, null: false

    def committee(id:)
      Committee.find(id)
    end
  end
end
