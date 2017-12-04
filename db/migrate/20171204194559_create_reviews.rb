class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :student_id
      t.text :body
      t.integer :teacher_id

      t.timestamps
    end
  end
end
