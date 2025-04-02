class QuizzesController < ApplicationController
    before_action :require_authentication
    before_action :set_quiz

    def show
      @index = params[:index].to_i - 1
      @question = @questions[@index]

      if @question.nil?
        redirect_to quiz_path(@quiz), alert: "Question not found."
      end
  
    end
  
    def answer
      @index = params[:index].to_i + 1
      previous_question = @questions[@index - 2]

  
      # feedback = params[:answer] == previous_question.answer.to_s ? "correct" : "incorrect"
  
      if @index >= @questions.count
        complete
      else
        redirect_to question_quiz_path(@quiz, @index), notice: feedback
      end
    end
  
    def complete
      flash[:notice] = "You've completed the quiz!"
      redirect_to root_path
    end


    private

    def set_quiz
      @quiz = Quiz.find(params[:id])
      @category = params[:category]
      @questions = case @category
                  when 'emails' then @quiz.email_questions
                  when 'texts' then @quiz.text_questions
                  when 'websites' then @quiz.website_questions
                  else []
                  end
    end
  end