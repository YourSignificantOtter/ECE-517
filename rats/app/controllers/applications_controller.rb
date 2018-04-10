class ApplicationsController < ApplicationController
  before_action :set_application, only: [:show, :edit, :update, :destroy]
  before_action :authorize

  # GET /applications
  # GET /applications.json
  def index
    @jobs = Job.all
    if current_role == :admin
      @applications = Application.all
    elsif current_role == :recruiter
      @applications = Application.all.select{|n| @jobs.exists?(n.job_id) && @jobs.find(n.job_id).company_id == current_user.company_id}
    else
      @applications = Application.all.select{|n| n.user_id==current_user.id}
    end
  end

  # GET /applications/1
  # GET /applications/1.json
  def show
  end

  # GET /applications/new
  def new
    @application = Application.new
    @j_id = params['j_id']
  end

  # GET /applications/1/edit
  def edit
    @j_id = @application.job_id
  end

  # POST /applications
  # POST /applications.json
  def create
    @application = current_user.applications.new(application_params)
    jb_id = params[:j_id]
    @application.status = 'Application Submitted'
    respond_to do |format|
      if @application.save
        format.html { redirect_to @application, notice: 'Application was successfully created.' }
        format.json { render :show, status: :created, location: @application }
      else
        @j_id = @application.job_id
        format.html { render :new }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /applications/1
  # PATCH/PUT /applications/1.json
  def update
    @j_id = @application.job_id
    respond_to do |format|
      if @application.update(application_params)
        format.html { redirect_to @application, notice: 'Application was successfully updated.' }
        format.json { render :show, status: :ok, location: @application }
      else
        format.html { render :edit }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /applications/1
  # DELETE /applications/1.json
  def destroy
    @application.destroy
    respond_to do |format|
      format.html { redirect_to applications_url, notice: 'Application was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_application
      @application = Application.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def application_params
      params.require(:application).permit(:j_id, :job_id, :user_id, :gender, :additional_info, :portfolio_url, :linkedin_url, :current_company, :disability_status, :veteran_status, :race, :status, :resume)
    end
end
