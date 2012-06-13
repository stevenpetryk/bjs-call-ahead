class Location < ActiveRecord::Base
	attr_accessible :city, :name, :phone, :state, :street, :zip

  validates_presence_of :city, :name, :phone, :state, :zip
  validates_uniqueness_of :name, :phone

  validates :zip, length: { minimum: 5, maximum: 5 }, numericality: true
  validates :phone, length: { minimum: 10, maximum: 10 }, numericality: true
end
