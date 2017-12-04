class Review < ApplicationRecord
  belongs_to :student
  belongs_to :teacher

  def when
    created_at.strftime("%B %e, %Y")
  end
end
