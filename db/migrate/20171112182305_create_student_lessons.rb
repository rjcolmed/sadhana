class CreateStudentLessons < ActiveRecord::Migration[5.1]
  def change
    create_table :student_lessons do |t|
      t.integer :student_id
      t.integer :lesson_id
    end
  end
end
