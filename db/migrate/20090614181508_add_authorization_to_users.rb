class AddAuthorizationToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :authorization, :string
  end

  def self.down
    remove_column :users, :authorization
  end
end
