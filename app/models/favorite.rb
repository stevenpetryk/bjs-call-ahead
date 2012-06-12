class Favorite < ActiveRecord::Base
  attr_accessible :item_id, :customer_id
  
  belongs_to :customer
  belongs_to :item

  validates_uniqueness_of :customer_id, :scope => [:item_id]
end
