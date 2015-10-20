class UserMailer < ApplicationMailer

  default from: "admin@epicoverflow.com"

  def signup_confirmation(user)
    @user = user
    mail to: @user.email, subject: "Sign Up Confirmation"
  end
end
