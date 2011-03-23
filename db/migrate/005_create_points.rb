class CreatePoints < ActiveRecord::Migration
  def self.up
    create_table :points do |t|
      t.integer :viewer_id
      t.string :name
      t.string :latitude
      t.string :longitude
      t.text :content
      t.boolean :formatted
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :points
  end
end
