class AddUserIdToEntry < ActiveRecord::Migration
  def self.up
    add_column :entries, :user_id, :int
  end

  def self.down
    remove_column :entries, :user_id
  end
end
