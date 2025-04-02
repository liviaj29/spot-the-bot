class EmailQuestion < ApplicationRecord
    has_many :quiz_questions, as: :question
    has_many :quizzes, through: :quiz_questions
  end
  