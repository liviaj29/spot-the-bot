class QuizzesController < ApplicationController
    before_action :require_authentication
    before_action :set_quiz

    def show
      @index = params[:index].to_i - 1
      @question = @quiz.questions[@index]

      if @question.nil?
        redirect_to quiz_path(@quiz), alert: "Question not found."
      end
  
    end
  
    def answer
      @index = params[:index].to_i + 1
      puts params[:answer]
      puts @quiz.questions[@index - 2].description
      puts @quiz.questions[@index - 2].answer
      fredback = params[:answer] == @quiz.questions[@index - 2].answer.to_s ? "correct" : "incorrect"
      if @index >= @quiz.questions.count
        complete()
      else
        redirect_to question_quiz_path(@quiz, @index), notice: fredback
      end
    end
  
    def complete
      flash[:notice] = "You've completed the quiz!"
      redirect_to root_path
    end


    private

    def set_quiz
      @quiz = Quiz.find(params[:id])
    end
  end