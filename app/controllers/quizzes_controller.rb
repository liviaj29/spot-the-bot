class QuizzesController < ApplicationController
    before_action :require_authentication
    before_action :set_quiz

    def show
      if @question.nil?
        redirect_to quiz_path(@quiz), alert: "Question not found."
      end
    end
  
    def answer
      if @question.nil?
        redirect_to quiz_path(@quiz), alert: "Invalid question reference." and return
      end
    
      @feedback = params[:answer] == @question.answer.to_s ? "Correct!" : "Incorrect."
    
      render :show
    end

    def next_question
      redirect_to question_quiz_path(@quiz, @category, @index+1)
    end
    
  
    def complete
      redirect_to root_path
    end


    private

    def set_quiz
      @quiz = Quiz.find(params[:id])
      @index = params[:index].to_i
      @category = params[:category]
      @questions = case @category
                  when 'emails' then @quiz.email_questions
                  when 'texts' then @quiz.text_questions
                  when 'websites' then @quiz.website_questions
                  else []
                  end
      @question = @questions[@index - 1]
      @feedback ||= nil
    end
  end