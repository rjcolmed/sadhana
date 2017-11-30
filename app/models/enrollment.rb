class Enrollment < ApplicationRecord
  belongs_to :student
  belongs_to :lesson
  has_one :comment
end