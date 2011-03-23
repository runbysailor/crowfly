class CreateDestinations < ActiveRecord::Migration
  def self.up
    create_table :destinations do |t|
      t.integer :viewer_id
      t.integer :position
      t.string :name
      t.string :altitude, :default => 21336000 #meters
      t.string :latitude, :default => 35.217768
      t.string :longitude, :default => -97.495151
      t.string :heading, :default => 0.000000
      t.string :tilt, :default => 0.000000      

      t.timestamps
    end
  end

  def self.down
    drop_table :destinations
  end
end
