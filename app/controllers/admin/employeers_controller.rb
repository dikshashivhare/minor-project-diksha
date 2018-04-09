class Admin::EmployeersController < ApplicationController
  # before_action :authenticate_admin!
  before_action :set_employeer, only: [:show, :edit, :update, :destroy]

  # GET /job_categories
  # GET /job_categories.json
  def index
    @employeers = Employeer.all
  end

  # GET /job_categories/1
  # GET /job_categories/1.json
  def show
  end

  # GET /job_categories/new
  def new
    @employeer = Employeer.new
  end

  # GET /job_categories/1/edit
  def edit
  end

  # POST /job_categories
  # POST /job_categories.json
  def create
    @employeer = Employeer.new(employeer_params)

    respond_to do |format|
      if @employeer.save
        format.html { redirect_to admin_employeer_path(@employeer), notice: 'Job category was successfully created.' }
        format.json { render :show, status: :created, location: @employeer }
      else
        format.html { render :new }
        format.json { render json: @employeer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /job_categories/1
  # PATCH/PUT /job_categories/1.json
  def update
    respond_to do |format|
      if @employeer.update(employeer_params)
        format.html { redirect_to admin_employeer_path(@employeer), notice: 'Job category was successfully updated.' }
        format.json { render :show, status: :ok, location: @employeer }
      else
        format.html { render :edit }
        format.json { render json: @employeer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job_categories/1
  # DELETE /job_categories/1.json
  def destroy
    @employeer.destroy
    respond_to do |format|
      format.html { redirect_to admin_employeers_url, notice: 'Job category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employeer
      @employeer = Employeer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employeer_params
      params.require(:employeer).permit!
    end
end