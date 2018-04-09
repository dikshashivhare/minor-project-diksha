class AddFieldsToJobSeekers < ActiveRecord::Migration[5.1]
  def change
    add_column :job_seekers, :first_name, :string
    add_column :job_seekers, :last_name, :string
    add_column :job_seekers, :contact, :string
    add_column :job_seekers, :address, :string
    add_column :job_seekers, :city, :string
    add_column :job_seekers, :state, :string
    add_column :job_seekers, :country, :string
    add_column :job_seekers, :profile_pic, :string
    add_column :job_seekers, :username, :string
    add_column :job_seekers, :about, :text
  end
end
