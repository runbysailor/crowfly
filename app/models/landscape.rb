class Landscape < ActiveRecord::Base
  belongs_to :viewer
  belongs_to :overlay
end