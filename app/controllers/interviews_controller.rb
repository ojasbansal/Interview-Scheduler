class InterviewsController < ApplicationController
  def index
    @interviews = Interview.all
  end

  def new
  end
end
