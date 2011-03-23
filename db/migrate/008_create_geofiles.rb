class CreateGeofiles < ActiveRecord::Migration
  def self.up
    create_table :geofiles do |t|
      t.integer :user_id
      t.integer :markup_id
      t.string :name
      t.string :link
      t.string :kml_file_name
      t.string :kml_content_type
      t.integer :kml_file_size
      t.datetime :kml_updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :geofiles
  end
end
