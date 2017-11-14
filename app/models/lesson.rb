# == Schema Information
#
# Table name: lessons
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  location    :string
#  teacher_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Lesson < ApplicationRecord
  belongs_to :teacher
  has_many :student_lessons
  has_many :students, through: :student_lessons
  has_many :lesson_tags
  has_many :tags, through: :lesson_tags
  accepts_nested_attributes_for :tags, reject_if: ->(attributes) { attributes['name'].blank? }


end

