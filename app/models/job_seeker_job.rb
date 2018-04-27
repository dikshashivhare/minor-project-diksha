class JobSeekerJob < ApplicationRecord
  belongs_to :job, optional: true
  belongs_to :job_seeker, optional: true
end
