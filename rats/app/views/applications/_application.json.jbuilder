json.extract! application, :id, :job_id, :user_id, :gender, :additional_info, :portfolio_url, :linkedin_url, :current_company, :disability_status, :veteran_status, :race, :created_at, :updated_at
json.url application_url(application, format: :json)
