class Option < ActiveRecord::Base
  has_and_belongs_to_many :items

  acts_as_tree

  attr_accessible :shortname, :name, :parent_id, :option_type
end
