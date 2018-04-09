json.extract! job, :id, :job_title, :email, :job_type, :venue, :city, :state, :country, :zipcode, :job_description, :salary_range, :employeer_id, :company_id, :created_at, :updated_at
json.url job_url(job, format: :json)
