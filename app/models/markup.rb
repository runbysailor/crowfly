class Markup < ActiveRecord::Base
  belongs_to :viewer
  belongs_to :geofile
end