class Job < ApplicationRecord

	paginates_per 5

	belongs_to :company,optional:true
	belongs_to :employeer,optional:true
	belongs_to :job_category,optional:true

  has_many :job_seeker_jobs
  has_many :job_seekers, through: :job_seeker_jobs

	geocoded_by :job_location
	after_validation :geocode

	def job_location
		"#{self.venue} #{self.city} #{self.state} #{self.country} #{self.zipcode}"
	end
end
