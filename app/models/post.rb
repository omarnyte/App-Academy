# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  url        :string
#  content    :text
#  sub_id     :integer          not null
#  author_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
  validates :title, :sub, :author, presence: true

  has_many :post_subs,
  primary_key: :id,
  foreign_key: :sub_id,
  class_name: 'PostSub'

  has_many :subs,
  through: :post_subs,
  source: :sub
end
