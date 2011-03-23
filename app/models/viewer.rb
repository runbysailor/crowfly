class Viewer < ActiveRecord::Base
  belongs_to :user
  has_one :beginning, :dependent => :delete
  has_many :destinations, :dependent => :destroy, :order => 'position'
  has_many :points, :dependent => :destroy
  has_many :landscapes, :dependent => :destroy
  has_many :overlays, :through => :landscapes, :order => 'position'
  has_many :markups, :dependent => :destroy
  has_many :geofiles, :through => :markups
  validates_presence_of :title, :link, :speed
  validates_uniqueness_of :title, :scope => [:user_id]
  validates_uniqueness_of :link, :scope => [:user_id]
  validates_format_of :link, :with => /^[-a-z]+$/, :message => 'can only contain lower-case letters'
  validates_numericality_of :speed, :greater_than_or_equal_to => 0.05, :less_than_or_equal_to => 5.00, :message => 'must be a number'
  has_attached_file :logo, :styles => { :original => ["300x300>", :png], :thumb => ["100x100>", :png] }
  before_save :set_dimensions

  def set_dimensions
    temp = self.logo.queued_for_write[:original]
    
    unless temp.nil?
      dimensions = Paperclip::Geometry.from_file(temp)
      self.logo_width = dimensions.width
      self.logo_height = dimensions.height
    end
  end
end