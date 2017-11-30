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

class Teacher < User
  has_many :lessons
  has_many :enrollments
  has_many :students, through: :enrollments

  def self.alphabetize
    order(:first_name)
  end

  def self.reverse_alphabetize
    alphabetize.reverse_order
  end
end
