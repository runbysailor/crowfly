class CreateOverlays < ActiveRecord::Migration
  def self.up
    create_table :overlays do |t|
      t.integer :user_id
      t.integer :landscape_id
      t.integer :position
      t.string :name
      t.string :north
      t.string :south
      t.string :east
      t.string :west
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :overlays
  end
end
