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

require 'test_helper'

class LessonTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
