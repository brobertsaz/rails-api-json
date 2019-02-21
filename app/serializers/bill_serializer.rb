class BillSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id,
             :number,
             :title,
             :summary,
             :full_text_url,
             :introduced_on,
             :house_voted_on,
             :senate_voted_on,
             :enacted_on,
             :vetoed_on,
             :deep_scraped_on,
             :created_at,
             :updated_at,
             :breakdown,
             :digging_deeper,
             :feature_state,
             :feature_position,
             :house_result,
             :senate_result,
             :banner_file_name,
             :banner_content_type,
             :banner_file_size,
             :banner_updated_at,
             :for_left,
             :for_right,
             :slug,
             :topic_id,
             :is_visible,
             :congress_id
end