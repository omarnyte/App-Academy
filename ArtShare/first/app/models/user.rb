class User < ApplicationRecord
  has_many :artworks

  has_many :artwork_shares,
    foreign_key: :viewer_id

  has_many :shared_artworks,
    through: :artwork_shares,
    source: :artwork

  validates :username, presence: true, uniqueness: true
  #validates :artist_id, uniqueness: {scope: :artworks}
end
