class ArtworkShare < ApplicationRecord
  belongs_to :viewer,
  primary_key: :id,
  foreign_key: :viewer_id, 
  class_name: 'User'

  belongs_to :artwork
end
