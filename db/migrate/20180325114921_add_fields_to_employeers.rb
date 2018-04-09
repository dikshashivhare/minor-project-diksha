class AddFieldsToEmployeers < ActiveRecord::Migration[5.1]
  def change
    add_column :employeers, :first_name, :string
    add_column :employeers, :last_name, :string
    add_column :employeers, :contact, :string
    add_column :employeers, :address, :string
    add_column :employeers, :city, :string
    add_column :employeers, :state, :string
    add_column :employeers, :country, :string
    add_column :employeers, :profile_pic, :string
    add_column :employeers, :username, :string
    add_column :employeers, :about, :text
  end
end
