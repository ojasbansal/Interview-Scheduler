class UserMailer < ApplicationMailer
  def interview_email
    @user = params[:user]
    @interview = params[:interview]
    mail(to: @user.user_email, subject: 'Interview Scheduled')
  end
end
