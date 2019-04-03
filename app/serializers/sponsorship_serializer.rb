# frozen_string_literal: true

class SponsorshipSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :kind

  belongs_to :bill
  belongs_to :member
end
