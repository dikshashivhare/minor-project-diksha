class ApplyJobController < ApplicationController

  def register
    @job = Job.find(params[:job_id])
    @job_seeker = JobSeeker.new
  end

  def create_job_registration

  end

end