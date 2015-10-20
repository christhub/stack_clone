class UsersController < ApplicationController
  def index
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
    # send email
      flash[:notice] = "user successfully created"
      redirect_to users_path
    elsif user_params[:password] != user_params[:password_confirmation]
      flash[:alert]  = "please try again, passwords did not match"
      redirect_to :back
    else
      flash[:alert] = 'just try again'
      redirect_to :back
    end
  end
  def new
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
