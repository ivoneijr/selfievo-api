class UserMailer < ApplicationMailer

  default from: "selfievo@selfievo.com"

  def new_record_notification(user)
    @user = user
    mail to: @user.email, subject: "Success! New user notification"
  end

  def retrieve_password_notification(user)
    @user = user
    mail to: @user.email, subject: "Success! Retrieved password notification"
  end

end
