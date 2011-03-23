class Geofile < ActiveRecord::Base
  belongs_to :user
  has_many :markups, :dependent => :destroy
  has_many :viewers, :through => :markups
  validates_presence_of :name
  validates_uniqueness_of :name, :scope => [:user_id]    
  has_attached_file :kml
  validates_attachment_content_type :kml, :content_type => [ 'application/vnd.google-earth.kml+xml', 'application/vnd.google-earth.kmz' ], :message => 'is not appropriate. Please use a file ending in .kml or .kmz.'
end