class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :content
      t.string :answers, array: true
      t.integer :correct_answer
      t.timestamps
    end
  end
end
