# == Schema Information
#
# Table name: users
#
#  id                    :integer          not null, primary key
#  first_name            :string
#  last_name             :string
#  username              :string
#  email                 :string
#  password_digest       :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  type                  :string
#  password_confirmation :string
#  image                 :string
#  uid                   :string
#  bio                   :text
#

class Student < User
  has_many :student_lessons
  has_many :lessons, through: :student_lessons
  has_many :teachers, through: :lessons
end
