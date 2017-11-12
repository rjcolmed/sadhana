class CreateLessons < ActiveRecord::Migration[5.1]
  def change
    create_table :lessons do |t|
      t.string :title
      t.text :description
      t.string :location
      t.integer :teacher_id

      t.timestamps
    end
  end
end
