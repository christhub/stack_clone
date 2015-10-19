class QuestionsController < ApplicationController
  def index
    @questions = Question.all
    @question = Question.new
  end

  def new
    @question = Question.new
  end

  def show
    @question = Question.find(params[:id])
  end

  def create
    @user = current_user
    if @user
    @question = @user.questions.new(question_params)
    end
    if @user == nil
      flash[:alert] = "Please log in."
      @question = Question.new
      render :new

    elsif @question.save
      redirect_to questions_path
    else
      redirect_to questions_path
    end
  end

  def destroy
    @user = current_user
    @question = @user.questions.find(params[:id])
    @question.answers.each do |answer|
      answer.destroy
    end
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
