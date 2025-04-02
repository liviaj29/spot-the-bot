class CreateWebsiteQuestions < ActiveRecord::Migration[8.0]
  def change
    create_table :website_questions do |t|
      t.integer :website_id
      t.text :url
      t.boolean :correct_answer

      t.timestamps
    end
  end
end
