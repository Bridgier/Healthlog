class CreateBicycles < ActiveRecord::Migration
  def self.up
    create_table :bicycles do |t|
      t.string :model
      t.integer :current_odometer
      t.integer :base_odometer

      t.timestamps
    end
  end

  def self.down
    drop_table :bicycles
  end
end
