class Admin::JobSeekersController < ApplicationController
  # before_action :authenticate_admin!
  before_action :set_job_seeker, only: [:show, :edit, :update, :destroy]

  # GET /job_categories
  # GET /job_categories.json
  def index
    @job_seekers = JobSeeker.all
  end

  # GET /job_categories/1
  # GET /job_categories/1.json
  def show
  end

  # GET /job_categories/new
  def new
    @job_seeker = JobSeeker.new
  end

  # GET /job_categories/1/edit
  def edit
  end

  # POST /job_categories
  # POST /job_categories.json
  def create
    @job_seeker = JobSeeker.new(job_seeker_params)

    respond_to do |format|
      if @job_seeker.save
        format.html { redirect_to admin_job_seeker_path(@job_seeker), notice: 'Job category was successfully created.' }
        format.json { render :show, status: :created, location: @job_seeker }
      else
        format.html { render :new }
        format.json { render json: @job_seeker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /job_categories/1
  # PATCH/PUT /job_categories/1.json
  def update
    respond_to do |format|
      if @job_seeker.update(employeer_params)
        format.html { redirect_to admin_job_seeker_path(@job_seeker), notice: 'Job category was successfully updated.' }
        format.json { render :show, status: :ok, location: @job_seeker }
      else
        format.html { render :edit }
        format.json { render json: @job_seeker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job_categories/1
  # DELETE /job_categories/1.json
  def destroy
    @job_seeker.destroy
    respond_to do |format|
      format.html { redirect_to admin_job_seekers_url, notice: 'Job category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_seeker
      @job_seeker = JobSeeker.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employeer_params
      params.require(:job_seeker).permit!
    end
end