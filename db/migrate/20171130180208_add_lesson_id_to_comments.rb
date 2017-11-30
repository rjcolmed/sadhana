class AddLessonIdToComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :lesson_id, :integer
  end
end
