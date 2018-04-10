class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_action :authorize

  # GET /jobs
  # GET /jobs.json
  def index
    if params.nil? || params[:job].nil? || params[:button] == :clear_filters.to_s
      @jobs = Job.all
      @name = ""
      @size = ""
      @industry = ""
      @headquarters = ""
    else
      @name = params[:job][:name]
      @size = params[:job][:size]
      @industry = params[:job][:industry]
      @headquarters = params[:job][:headquarters]
      @jobs = filter(Job.all,{:name => @name, :size => @size, :industry => @industry, :headquarters => @headquarters})
    end
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
  end

  # GET /jobs/new
  def new
    if current_user.company_id.nil? && current_role != :admin
      respond_to do |format|
        format.html { redirect_to jobs_url, notice: 'Cannot create Job if you are not part of a Company.' }
        format.json { render :index, status: :failed }
      end
    else
      @job = Job.new
      generate_companies_list
    end
  end

  # GET /jobs/1/edit
  def edit
    generate_companies_list
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @job = Job.new(job_params)
    @job.user_id = current_user.id
    if current_role == :recruiter and !current_user.company_id.nil?
      @job.company_id = current_user.company_id
      @company = Company.find(current_user.company_id)
    end
    respond_to do |format|
      if @job.save
        format.html { redirect_to @job, notice: 'Job was successfully created.' }
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
    #generate_companies_list
    #@companies.each {|idx, name| if name == job_params[:company] then @job.company_id = idx end}
    if current_role == :recruiter and !current_user.company_id.nil?
      @job.company_id = current_user.company_id
      @company = Company.find(current_user.company_id)
    end
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  # noinspection RailsChecklist01
  def destroy
    Application.close_applications @job
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:job_title, :company_id, :employment_type, :job_description, :requirements, :responsibilities)
    end

    #generate the @companies instance variable for views use
    def generate_companies_list
      if current_role ==  :admin
        @companies = Company.distinct.pluck(:id, :name)
      elsif current_role ==  :recruiter
        @companies = Company.find(current_user.company_id)
      end
    end

  def filter(recs,attr_hash)
    toReturn = []
    recs.each do |rec|
        addRec = true

        attr_hash.each do |attr,str|
          if !str.nil?() && (rec.company_obj.nil? || rec.company_obj[attr.to_s].nil? || !rec.company_obj[attr.to_s].downcase.include?(str.downcase))
            addRec = false
          end
        end

        toReturn.append(rec) if addRec
    end
    return toReturn
  end
end
