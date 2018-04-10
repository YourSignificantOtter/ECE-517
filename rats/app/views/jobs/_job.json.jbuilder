json.extract! job, :id, :company_id, :employment_type, :job_description, :requirements, :responsibilities, :created_at, :updated_at
json.url job_url(job, format: :json)
