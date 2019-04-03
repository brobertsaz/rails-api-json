# frozen_string_literal: true

class VoteSerializer
  include FastJsonapi::ObjectSerializer
  attributes :position

  belongs_to :member
  belongs_to :bill
end
