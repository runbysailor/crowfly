class Beginning < ActiveRecord::Base
  belongs_to :viewer
  validates_presence_of :name
  validates_uniqueness_of :name, :scope => [:viewer_id]
  validates_numericality_of :altitude, :latitude, :longitude, :heading, :tilt
end