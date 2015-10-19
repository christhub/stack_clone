class QuestionsController < ApplicationController
  def index
    @questions = Question.all
    @question = Question.new
  end

  def new

  end

  def create
    @user = current_user
    @question = @user.questions.new(question_params)
    if @question.save
      redirect_to questions_path
    else
      redirect_to questions_path
    end
  end

  def destroy
    @user = current_user
    @question = @user.questions.find(params[:id])
    if @question.destroy
      flash[:notice] = "Question deleted"
      redirect_to questions_path
    else
      redirect_to questions_path
    end
  end

  private
  def question_params
    params.require(:question).permit(:question, :content)
  end

end
