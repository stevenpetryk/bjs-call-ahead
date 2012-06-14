class Option < ActiveRecord::Base
  belongs_to :item

  acts_as_tree

  attr_accessible :shortname, :name, :parent_id, :option_type
end
