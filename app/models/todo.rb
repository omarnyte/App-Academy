# == Schema Information
#
# Table name: todos
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  done       :boolean
#

class Todo < ApplicationRecord
  validates :done, inclusion: { in: [true, false] }
end
