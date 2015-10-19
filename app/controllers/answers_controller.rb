class AnswersController < ApplicationController

  def new
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new
  end

  def create
    @user = current_user
    @question = @user.questions.find(params[:question_id])
    @answer = @question.answers.new(answer_params)
    if @answer.save &&  @answer.update(user_id: @user.id)
      redirect_to question_path(@question)
    else
      render :new
    end
  end

  def update
    @user = current_user
    @question = @user.questions.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    binding.pry
    if params[:upvote] == true
      upvote = @answer.upvote
      if upvote != nil
        upvote = upvote + 1
        @answer.update(upvote: upvote)
        # redirect_to question_path(@question)
      else
        @answer.update(upvote: 1)
        # redirect_to question_path(@question)
    end
    end
  end

  def destroy
    @user = current_user
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    @answer.destroy

    redirect_to question_path(@question)
  end

  private
  def answer_params
    params.require(:answer).permit(:content)
  end
end
