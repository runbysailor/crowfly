class CreateMarkups < ActiveRecord::Migration
  def self.up
    create_table :markups do |t|
      t.integer :viewer_id
      t.integer :geofile_id

      t.timestamps
    end
  end

  def self.down
    drop_table :markups
  end
end
