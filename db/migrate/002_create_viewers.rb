class CreateViewers < ActiveRecord::Migration
  def self.up
    create_table :viewers do |t|
      t.integer :user_id
      t.string :title
      t.string :link
      t.string :speed, :default => 0.50
      t.boolean :navigation_option, :default => true
      t.boolean :navigation_default, :default => true
      t.boolean :scale_option, :default => true
      t.boolean :scale_default, :default => false
      t.boolean :borders_option, :default => true
      t.boolean :borders_default, :default => false
      t.boolean :buildings_option, :default => true
      t.boolean :buildings_default, :default => false
      t.boolean :roads_option, :default => true
      t.boolean :roads_default, :default => false
      t.boolean :terrain_option, :default => true
      t.boolean :terrain_default, :default => false
      t.string :logo_file_name
      t.string :logo_content_type
      t.integer :logo_file_size
      t.datetime :logo_updated_at
      t.integer :logo_width
      t.integer :logo_height      

      t.timestamps
    end
  end

  def self.down
    drop_table :viewers
  end
end