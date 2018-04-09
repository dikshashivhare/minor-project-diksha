class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.string :job_title
      t.string :email
      t.string :job_type
      t.string :venue
      t.string :city
      t.string :state
      t.string :country
      t.string :zipcode
      t.text :job_description
      t.string :salary_range
      t.integer :employeer_id
      t.integer :company_id

      t.timestamps
    end
  end
end
