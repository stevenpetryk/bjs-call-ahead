class Category < ActiveRecord::Base
  attr_accessible :icon, :name
  validates :name, presence: true

  has_many :items
end
