class RenameStudentLessons < ActiveRecord::Migration[5.1]
  def change
    rename_table :student_lessons, :enrollments
  end
end
