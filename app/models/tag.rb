class Tag < ApplicationRecord
  has_many :lesson_tags
  has_many :lessons, through: :lesson_tags

  validates :name, presence: true, allow_blank: true
end
