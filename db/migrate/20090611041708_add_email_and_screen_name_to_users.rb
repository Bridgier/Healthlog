class AddEmailAndScreenNameToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :screen_name, :string
    add_column :users, :email, :string
    remove_column :users, :name
  end

  def self.down
    remove_column :users, :email
    remove_column :users, :screen_name
    add_column :users, :name, :string
  end
end
