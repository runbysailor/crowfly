class Overlay < ActiveRecord::Base
  acts_as_list :scope => :user
  belongs_to :user
  has_many :landscapes, :dependent => :destroy
  has_many :viewers, :through => :landscapes
  validates_presence_of :name, :image_file_name
  validates_uniqueness_of :name, :scope => [:user_id]  
  validates_numericality_of :north, :south, :east, :west
  has_attached_file :image, :styles => { :thumb => ["100x100>"] }
end