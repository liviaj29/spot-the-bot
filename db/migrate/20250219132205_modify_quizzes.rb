class ModifyQuizzes < ActiveRecord::Migration[8.0]
  def change
      remove_column :quizzes, :question, :string
      remove_column :quizzes, :answer, :boolean
      add_column :quizzes, :title, :string
  end
end
