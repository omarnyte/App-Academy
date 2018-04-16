class Cat < ApplicationRecord
  include ActionView::Helpers::DateHelper

  validates :color, inclusion: { in: %w(black white orange brown gray calico tabby) }
  validates :sex, inclusion: { in: %w(M F) }

  validates :birth_date, :color, :name, :sex, :description, presence: true

  has_many :cat_rental_requests, dependent: :destroy


  def age
    time_ago_in_words(self.birth_date)
  end

end
# Cat.create(birth_date: "2017-10-17", color: "black", name: "Purrnie Sanders", sex: "F", description: "Hates the one purrcent")
