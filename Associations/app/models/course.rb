class Course < ApplicationRecord
  has_many :users,
  class_name: :User,
  foreign_key: :student_id,
  primary_key: :id
end
