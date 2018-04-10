class Job < ApplicationRecord
  has_many :applications         #, dependent: :destroy Destroys applications if a job is deleted

  validates :job_title, presence: true
  validates :employment_type, presence: true
  validates :job_description, presence: true
  validates :requirements, presence: true
  validates :responsibilities, presence: true

  def self.destroy_recruiter_jobs(user)
    @jobs = Job.all.select {|j| j.user_id == user.id}
    if @jobs
      if @jobs.respond_to?(:each)
        @jobs.each do |j|
          Application.close_applications j
          j.destroy
        end
      else
        Application.close_applications @jobs
        @jobs.destroy(@jobs.id)
      end
    end
  end

  def self.destroy_company_jobs(company)
    @jobs = Job.all.select {|j| j.company_id == company.id}
    if @jobs
      if @jobs.respond_to?(:each)
        @jobs.each do |j|
          Application.close_applications j
          j.destroy
        end
      else
        Application.close_applications @jobs
        @jobs.destroy(@jobs.id)
      end
    end
  end

  def company
    if self.has_attribute?(:company_id) && Company.exists?(self.company_id)
      return Company.find(self.company_id).name
    else
      return "---"
    end
  end

  def company_obj
    if self.has_attribute?(:company_id) && Company.exists?(self.company_id)
      return Company.find(self.company_id)
    end
  end
end
