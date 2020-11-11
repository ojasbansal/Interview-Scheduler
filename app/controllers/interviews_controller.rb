class InterviewsController < ApplicationController
  def index
    @interviews = Interview.all
  end

  def new
    @interview = Interview.new
  end

  def create
    
  end

  def edit
    @interview = Interview.find(params[:id])
  end
end
