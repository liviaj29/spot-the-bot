class CreateTextQuestions < ActiveRecord::Migration[8.0]
  def change
    create_table :text_questions do |t|
      t.text :title
      t.text :link
      t.text :body
      t.boolean :answer

      t.timestamps
    end
  end
end
