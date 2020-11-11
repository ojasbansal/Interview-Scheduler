class InterviewsController < ApplicationController
  def index
    @interviews = Interview.all
  end

  def new
    @interview = Interview.new
  end

  def create
    @interview = Interview.new(interview_params)
    
    if @interview.save
      redirect_to interviews_path
    else
      render 'new'
    end
  end

  def edit
    @interview = Interview.find(params[:id])
  end

  def show
    @interview = Interview.find(params[:id])
    @users = @interview.users
  end

  def update
    @interview = Interview.find(params[:id])
    if @interview.update(interview_params)
      flash[:notice] = "Interview was updated successfully"
      redirect_to interviews_path
    else
      render 'edit'
    end
  end

  private

  def interview_params
    params.require(:interview).permit(:starttime,:endtime, user_ids: [])
  end

end

