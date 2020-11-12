class InterviewsController < ApplicationController
  before_action :set_interview, only: [:show, :edit, :update, :destroy]

  def index
    @interviews = Interview.all
  end

  def new
    @interview = Interview.new
  end

  def create
    @interview = Interview.new(interview_params)
    if @interview.save
      flash[:notice] = "Interview was created successfully"
      #send_email @interview
      redirect_to interviews_path
    else
      render 'new'
    end
  end

  def edit
  end

  def show
    @users = @interview.users
  end

  def update
    if @interview.update(interview_params)
      flash[:notice] = "Interview was updated successfully"
      redirect_to interviews_path
    else
      render 'edit'
    end
  end

  def destroy
    @interview.destroy
    redirect_to interviews_path
  end

  private

  def interview_params
    params.require(:interview).permit(:starttime,:endtime, user_ids: [])
  end

  def set_interview
    @interview = Interview.find(params[:id])
  end

  def send_email interview
    interview.users.each do |user|
      UserMailer.with(user: user, interview: @interview).interview_email.deliver_now
    end  
  end
end

