json.extract! company, :id, :name, :tagline, :description, :email, :contact, :website, :established_on, :staff_size, :address, :facebook_url, :twitter_url, :linkedin_url, :google_plus_url, :employeer_id, :created_at, :updated_at
json.url company_url(company, format: :json)
