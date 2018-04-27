class JobsController < ApplicationController
  # before_action :authenticate_job_seeker!, :only => [:show]
  def index
    @jobs = Job.all
  end
  def show
    @job = Job.find(params[:id])
  end
end