class CreateQuizQuestions < ActiveRecord::Migration[8.0]
  def change
    create_table :quiz_questions do |t|
      t.references :quiz, null: false, foreign_key: true
      t.integer :question_id
      t.string :question_type

      t.timestamps
    end
  end
end
