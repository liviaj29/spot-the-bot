class CreateEmailQuestions < ActiveRecord::Migration[8.0]
  def change
    create_table :email_questions do |t|
      t.text :subject
      t.text :link
      t.text :body
      t.boolean :answer

      t.timestamps
    end
  end
end
