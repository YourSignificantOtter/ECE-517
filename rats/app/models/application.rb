class Application < ApplicationRecord
  belongs_to :user
  belongs_to :job

  mount_uploader :resume, ResumeUploader

  validates :gender, presence: true, exclusion: { in: %w(-), message: "Please select gender"}
  validates :portfolio_url, presence: true, format: {with: /\Ahttps?:\/\/www.[a-zA-Z0-9]{3,}.[a-zA-z0-9]{2,3}\Z/, message:
      'Must be of the form http(s)://www.website.com/org/etc'}
  validates :linkedin_url, presence: true, format: {with: /http(s)?:\/\/([\w]+\.)?linkedin\.com\/in\/[A-z0-9_-]\/?/, message:
      'Must be of the form http(s)://www.linkedin.com/in/yourname'}
  validates :disability_status, presence: true, exclusion: { in: %w(-), message: "Please select disability status"}
  validates :veteran_status, presence: true, exclusion: { in: %w(-), message: "Please select veteran status"}
  validates :race, presence: true, exclusion: { in: %w(-), message: "Please select race"}

  def self.destroy_user_applications(user)
    @applications = Application.all.select {|j| j.user_id == user.id}
    if @applications
      if @applications.respond_to?(:each)
        @applications.each {|j| j.destroy}
      else
        @applications.destroy(@applications.id)
      end
    end
  end

  def self.close_applications(job)
    @applications = Application.all.select {|j| j.job_id == job.id}
    if @applications
      if @applications.respond_to?(:each)
        @applications.each do |j|
          j.status = "Position closed"
          j.save
        end
      else
        @applications.status = "Position closed"
        @applications.save
      end
    end
  end

end
