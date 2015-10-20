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
    @vote = Vote.where(user_id: current_user.id, votable_id: @answer.id)
    if @vote.any?
      flash[:notice] = "You cannot vote again"
    # binding.pry
    else
      @answer.votes.create(vote: params[:v][:votes], user_id: current_user.id, votable_id: @answer.id)
    end
    redirect_to question_path(@question)
    # if answer_params[:upvote]
    #   upvote = @answer.upvote
    #   if upvote != nil
    #     upvote = upvote + 1
    #     @answer.update(upvote: upvote)
    #     redirect_to question_path(@question)
    #   else
    #     @answer.update(upvote: 1)
    #     redirect_to question_path(@question)
    #   end
    # elsif answer_params[:downvote]
    #   downvote = @answer.downvote
    #   if downvote != nil
    #     downvote = downvote - 1
    #     @answer.update(downvote: downvote)
    #     redirect_to question_path(@question)
    #   else
    #     @answer.update(downvote: 1)
    #     redirect_to question_path(@question)
    #   end
    # else
    #   redirect_to question_path(@question)
    # end
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
