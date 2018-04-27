class CreateJobSeekerJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :job_seeker_jobs do |t|
      t.references :job, foreign_key: true
      t.references :job_seeker, foreign_key: true

      t.timestamps
    end
  end
end
