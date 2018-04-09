json.extract! job_category, :id, :name, :icon_url, :description, :created_at, :updated_at
json.url job_category_url(job_category, format: :json)
