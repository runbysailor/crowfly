class CreateLandscapes < ActiveRecord::Migration
  def self.up
    create_table :landscapes do |t|
      t.integer :viewer_id
      t.integer :overlay_id

      t.timestamps
    end
  end

  def self.down
    drop_table :landscapes
  end
end
