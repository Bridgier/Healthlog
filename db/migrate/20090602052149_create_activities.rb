class CreateActivities < ActiveRecord::Migration
  def self.up
    create_table :activities do |t|
      
      t.column :log_entry_id, 	:int
      t.column :activity_type,	:string
      t.column :activity_duration, :float
      t.timestamps
    end
  end

  def self.down
    drop_table :activities
  end
end
