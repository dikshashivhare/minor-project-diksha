class CreateJobCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :job_categories do |t|
      t.string :name
      t.string :icon_url
      t.text :description

      t.timestamps
    end
  end
end
