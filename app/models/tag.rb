# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tag < ApplicationRecord
  has_many :lesson_tags
  has_many :lessons, through: :lesson_tags

  validates :name, presence: true

  def self.most_popular
    joins(:lessons).order('COUNT(tags.id) DESC').group('tags.id').limit(1)
  end
end
