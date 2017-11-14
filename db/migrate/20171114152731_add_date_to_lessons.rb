class AddDateToLessons < ActiveRecord::Migration[5.1]
  def change
    add_column :lessons, :date, :datetime
  end
end
