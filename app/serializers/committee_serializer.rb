# frozen_string_literal: true

class CommitteeSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :bioguide_id

  has_many :visible_bills, polymorphic: true
end
