class AddResumeToJobSeekers < ActiveRecord::Migration[5.1]
  def change
    add_column :job_seekers, :resume, :string
  end
end
