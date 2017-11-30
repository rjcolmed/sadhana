class CreateCommentLessons < ActiveRecord::Migration[5.1]
  def change
    create_table :comment_lessons do |t|
      t.integer :lesson_id
      t.integer :comment_id
    end
  end
end
