class PostSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id,
             :state,
             :publish_at,
             :body,
             :kind,
             :source,
             :url,
             :title,
             :image_file_name,
             :image_content_type,
             :image_file_size,
             :image_updated_at,
             :topic_id
end
