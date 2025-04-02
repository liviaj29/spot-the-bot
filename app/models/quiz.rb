class Quiz < ApplicationRecord
    has_many :quiz_questions
    has_many :email_questions, through: :quiz_questions, source: :question, source_type: 'EmailQuestion'
    has_many :text_questions, through: :quiz_questions, source: :question, source_type: 'TextQuestion'
    has_many :website_questions, through: :quiz_questions, source: :question, source_type: 'WebsiteQuestion'

    validates :title, presence: true
end
