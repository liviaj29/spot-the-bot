class CreateQuizzes < ActiveRecord::Migration[8.0]
  def change
    create_table :quizzes do |t|
      t.string :question
      t.boolean :answer

      t.timestamps
    end
  end
end
