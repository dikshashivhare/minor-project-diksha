class ApplyJobController < ApplicationController
  def register
    @job = Job.find(params[:job_id])
    @job_seeker = JobSeeker.new
  end
  def create_job_registration
    @job = Job.find(params[:job_seeker][:job_id])
    @employeer = @job.employeer
    @job_seeker = JobSeeker.new(job_seeker_params)
    if @job_seeker.save
      NotificationMailer.notification_to_employeer_for_job_application(@job_seeker, @employeer, @job).deliver_now
      NotificationMailer.notification_to_job_seeker_for_job_application(@job_seeker, @job).deliver_now
      @job_seeker_job = @job_seeker.job_seeker_jobs.create(job_id: @job.id)
      sign_in(@job_seeker, scope: :job_seeker)
      redirect_to root_path
    else
      render 'register' 
    end
  end

  
  private 
  def job_seeker_params
    params.require(:job_seeker).permit(:first_name, :last_name, :username, :email, :password, :contact, :city,:state,:country,:address,:profile_pic,:about,:resume)
  end
end