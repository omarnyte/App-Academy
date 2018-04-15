class Visit < ApplicationRecord
  belongs_to :visitor,
  class_name: :User,
  primary_key: :id,
  foreign_key: :user_id

  belongs_to :visited_url,
  class_name: :ShortenedUrl,
  primary_key: :id,
  foreign_key: :short_url_id

  
end
