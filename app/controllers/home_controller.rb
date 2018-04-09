class HomeController < ApplicationController
  def index
  	@job_categories = JobCategory.all
  end

  def all_jobs
  	@jobs = Job.order(:job_title).page params[:page]
  end

end
