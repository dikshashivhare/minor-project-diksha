class AddRefsToJobs < ActiveRecord::Migration[5.1]
  def change
    add_column :jobs, :job_category_id, :integer
  end
end
