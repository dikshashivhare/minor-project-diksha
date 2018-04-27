class AddTotalPositionToJobs < ActiveRecord::Migration[5.1]
  def change
    add_column :jobs, :total_position, :integer
  end
end
