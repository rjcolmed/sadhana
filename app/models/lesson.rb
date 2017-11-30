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
#  date        :datetime
#  time        :datetime
#

class Lesson < ApplicationRecord
  belongs_to :teacher
  has_many :enrollments
  has_many :students, through: :enrollments
  has_many :lesson_tags
  has_many :tags, through: :lesson_tags
  has_many :comments, through: :enrollments

  validates :title, presence: true, length: { in: 10...100 }
  validates :description, presence: true, length: { maximum: 1500 }
  validates :location, presence: true
  validates :date, 
            date: { after: Proc.new { Time.now + 1.day }, 
                    before: Proc.new {Time.now + 1.year } }
  validates :time, presence: true

  def tags_attributes=(tag_attributes)
    tag_attributes.values.each do |tag_attribute|
      tag = Tag.find_or_create_by(tag_attribute)
      self.tags << tag unless tag.name.blank?
    end
  end

  def when
    date.strftime("%B %e, %Y") + " at " + time.strftime("%l:%M%P")
  end

  def enrolled_students
    students.size
  end
end

