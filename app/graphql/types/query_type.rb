module Types
  class QueryType < BaseObject

    field :all_bills, [BillType], null: false

    def all_bills
      Bill.visible
    end

    field :featured_bills, [BillType], null: false

    def featured_bills
      Bill.special.order('feature_position asc')
    end

    field :bill, BillType, null: false do
      argument :id, ID, required: true
    end

    field :bills, [BillType], null: false do
      argument :user_id, ID, required: true
      argument :filter, String, required: false
    end

    def bills(user_id:, filter:)
      user = User.find(user_id)
      if filter == 'following'
        user.favorite_bills
      else
        Bill.visible
      end
    end

    def bill(id:)
      Bill.find(id)
    end

    field :all_members, [MemberType], null: false

    def all_members
      Member.ordered.in_office
    end

    field :members, [MemberType], null: false do
      argument :user_id, ID, required: true
      argument :filter, String, required: false
    end
    
    def members(user_id:, filter:)
      user = User.find(user_id)
      if filter == 'following'
        user.favorite_members.in_office.ordered
      elsif filter == 'state'
        Member.where(state: user.state).in_office.ordered
      else
        Member.ordered.in_office
      end
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

    field :posts, [PostType], null: false do
      argument :user_id, ID, required: true
      argument :filter, String, required: false
    end

    def posts(user_id:, filter:)
      user = User.find(user_id)
      if filter == 'following'
        user.favorite_posts.actually_published.ordered
      elsif filter == 'article'
        Post.actually_published.where(kind: 'article').ordered
      elsif filter == 'video'
        Post.actually_published.where(kind: 'video').ordered
      else
        Post.actually_published.ordered
      end
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
