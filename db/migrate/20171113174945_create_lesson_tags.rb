class CreateLessonTags < ActiveRecord::Migration[5.1]
  def change
    create_table :lesson_tags do |t|
      t.integer :lesson_id
      t.integer :tag_id
    end
  end
end
