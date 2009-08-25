class CreateEntries < ActiveRecord::Migration
  def self.up
    create_table :entries do |t|
      t.column :entry_date, :datetime
      t.column :weight, :float
      t.column :notes, :text
      t.timestamps
    end
  end

  def self.down
    drop_table :entries
  end
end
