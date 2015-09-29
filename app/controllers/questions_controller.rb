class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to @question
    else
      render new_question_path, alert: "You're question could not be created. Please try again."
    end
  end

  def show
    @question = Question.find(params[:id])
  end


private

  def question_params
    params.require(:question).permit(:body)
  end
end
