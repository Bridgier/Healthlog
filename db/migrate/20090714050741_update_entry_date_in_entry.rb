class UpdateEntryDateInEntry < ActiveRecord::Migration
  def self.up
    change_column :entries, :entry_date, :date
  end

  def self.down
    change_column :entries, :entry_date, :datetime
  end
end
