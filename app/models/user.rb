class User < ActiveRecord::Base  
  devise :database_authenticatable, :confirmable, :registerable, :recoverable, :trackable, :validatable, :invitable
  attr_accessible :email, :password, :password_confirmation, :first_name, :last_name, :company_name
  validates_presence_of :first_name, :last_name, :company_name
  validates_uniqueness_of :company_name
  validates_format_of :company_name, :with => /^[-a-z]+$/
  has_many :viewers
  has_many :overlays
  has_many :geofiles
  
  def to_param
    company_name
  end
end