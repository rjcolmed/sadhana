class Comment < ApplicationRecord
  belongs_to :student
  belongs_to :lesson
  belongs_to :enrollment
end
