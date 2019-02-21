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
             :bio


end
