class Point < ActiveRecord::Base
  belongs_to :viewer
  validates_presence_of :name
  validates_uniqueness_of :name, :scope => [:viewer_id]
  validates_numericality_of :latitude, :longitude, :message => 'must be a number'
  has_attached_file :image, :styles => { :cropped => ["300x300>"], :thumb => ["100x100>"] }
end