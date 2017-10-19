class ShortenedUrl < ApplicationRecord
  belongs_to :submitter,
  class_name: :User,
  primary_key: :id,
  foreign_key: :user_id

  has_many :visits,
  class_name: :Visit,
  primary_key: :id,
  foreign_key: :short_url_id

  has_many :visitors,
  through: :visits,
  source: :visitor

  validates :long_url, presence: true
  validates :short_url, presence: true, uniqueness: true

  def self.create_row(user, long_url)
    ShortenedUrl.create!(user_id: user.id, long_url: long_url, short_url: ShortenedUrl.random_code)
  end

  def self.random_code
    random_url = SecureRandom.urlsafe_base64

    while ShortenedUrl.exists?(short_url: random_url)
      random_url = SecureRandom.urlsafe_base64
    end

    random_url
  end

  def num_clicks
    # Visit.all.count { |visit| visit.short_url_id == self.id }
    Visit.where("short_url_id = #{self.id}").count

  end

  def num_uniques
    Visit.select(:user_id).distinct.count

    # visits = Visit.all.select { |visit| visit.short_url_id == self.id }
    #
    # uniques = []
    # visits.each { |visit| uniques << visit unless uniques.include?(visit) }
    # uniques.length


  end
end
