class UpdateQuestions < ActiveRecord::Migration[7.0]
  def change
    remove_column :questions, :description, :string # Remove old field
    add_column :questions, :subject, :string
    add_column :questions, :link, :string
    add_column :questions, :body, :text
  end
end
