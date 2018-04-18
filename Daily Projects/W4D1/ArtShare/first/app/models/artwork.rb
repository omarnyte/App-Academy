class Artwork < ApplicationRecord
  belongs_to :user,
  foreign_key: :artist_id

  has_many :artwork_shares

  has_many :shared_viewers,
    through: :artwork_shares,
    source: :viewer

  validates :title, uniqueness: {scope: :user}
end
