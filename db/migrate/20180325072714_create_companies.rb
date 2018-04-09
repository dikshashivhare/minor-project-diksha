class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :tagline
      t.text :description
      t.string :email
      t.string :contact
      t.string :website
      t.string :established_on
      t.string :staff_size
      t.string :address
      t.string :facebook_url
      t.string :twitter_url
      t.string :linkedin_url
      t.string :google_plus_url
      t.integer :employeer_id

      t.timestamps
    end
  end
end
