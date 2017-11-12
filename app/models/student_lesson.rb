# == Schema Information
#
# Table name: student_lessons
#
#  id         :integer          not null, primary key
#  student_id :integer
#  lesson_id  :integer
#

class StudentLesson < ApplicationRecord
  belongs_to :student
  belongs_to :lesson
end
