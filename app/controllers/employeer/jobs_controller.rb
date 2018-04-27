class Employeer::JobsController < ApplicationController
  before_action :authenticate_employeer!, only: [:create, :new, :edit, :update, :destroy]
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  layout 'employeer'
  # GET /jobs
  # GET /jobs.json
  def index
    @jobs = current_employeer.jobs
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
  end

  # GET /jobs/new
  def new
    @job = Job.new 
  end

  # GET /jobs/1/edit
  def edit
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @job = Job.new(job_params)

    respond_to do |format|
      if @job.save
        format.html { redirect_to employeer_job_path(@job), notice: 'Job was successfully created.' }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to employeer_job_path(@job), notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to employeer_jobs_url, notice: 'Job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def job_applicants
    @jobs = current_employeer.jobs
    @applicants = @jobs.map {|j| j.job_seeker_jobs }.flatten
  end

  def applicant_details
    @job_seeker = JobSeeker.find(params[:applicant_id])
    @job_seeker_job = JobSeekerJob.find(params[:job_seeker_job])
  end

  def application_status
    @job_seeker_job = JobSeekerJob.find(params[:job_seeker_job_id])
    if @job_seeker_job.update(job_application_status: params[:status])
      if params[:status] == "Accepted"
        @job_seeker_job.job.update(total_position: @job_seeker_job.job.total_position - 1)
        puts "Accepted"
      else
        @job_seeker_job.job.update(total_position: @job_seeker_job.job.total_position)
        puts "denied"
      end
      respond_to do |format|
        if @job_seeker_job.job_application_status == "Accepted"
          NotificationMailer.job_acceptance_notification_to_job_seeker(@job_seeker_job).deliver_now
        end
        format.html { redirect_to applicant_details_employeer_jobs_path(applicant_id: @job_seeker_job.job_seeker.id, job_seeker_job: @job_seeker_job.id), notice: "Application status has been updated successfully." }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit!
    end
end
