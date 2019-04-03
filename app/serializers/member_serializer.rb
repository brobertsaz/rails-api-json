# frozen_string_literal: true

class MemberSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id,
             :name,
             :title,
             :short_title,
             :first_name,
             :middle_name,
             :last_name,
             :suffix,
             :date_of_birth,
             :party,
             :leadership_role,
             :url,
             :office_address,
             :phone,
             :fax,
             :bioguide_id,
             :gender,
             :twitter,
             :facebook,
             :youtube,
             :slug,
             :in_office,
             :facebook_photo_scraped_at,
             :facebook_photo_scrape_status,
             :bio,
             :state,
             :bills,
             :votes

  def bills
    object.bills.where(is_visible: true).map do |bill|
      BillsSerializer.new(bill)
    end
  end

  def votes
    object.votes.map do |vote|
      VotesSerializer.new(vote)
    end
  end
end
