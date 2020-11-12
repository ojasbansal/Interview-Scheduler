class UserMailer < ApplicationMailer
  before_action :set_user_interview

  def interview_email
    mail(to: @user.user_email, subject: 'Interview Scheduled')
  end

  def cancel_interview_email
    mail(to: @user.user_email, subject: 'Interview Scheduled')
  end

  def edit_interview_email
    mail(to: @user.user_email, subject: 'Interview Scheduled')
  end

  def reminder_interview_email
    mail(to: @user.user_email, subject: 'Interview Scheduled')
  end

  private
    def set_user_interview
      @user = params[:user]
      @interview = params[:interview]
    end

end
