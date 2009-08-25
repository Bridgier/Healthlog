class RemoveAuthorizationFromUsers < ActiveRecord::Migration
  def self.up
    remove_column :users, :authorization
    add_column :users, :authorization_token, :string
  end

  def self.down
    add_column :users, :authorization, :string
    remove_column :users, :authorization_token

  end
end
