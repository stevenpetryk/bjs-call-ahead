class Item < ActiveRecord::Base
  belongs_to :category

  attr_accessible :id, :description, :name, :price, :category_id
end
