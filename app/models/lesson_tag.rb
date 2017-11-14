# == Schema Information
#
# Table name: lesson_tags
#
#  id        :integer          not null, primary key
#  lesson_id :integer
#  tag_id    :integer
#

class LessonTag < ApplicationRecord
  belongs_to :lesson
  belongs_to :tag
end
