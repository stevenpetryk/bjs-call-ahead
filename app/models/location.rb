class Location < ActiveRecord::Base
  attr_accessible :city, :name, :phone, :state, :street, :zip

  validates_presence_of :city, :name, :phone, :state, :zip
  validates :zip, length: { minumum: 5, maximum: 5 }, numericality: true
  validates :phone, length: { minumum: 5, maximum: 5 }, numericality: true
end
