class CreateItemsOptionsJoinTable < ActiveRecord::Migration
  def up
  	create_table :items_options do |t|
  		t.references :item
  		t.references :option
  	end
  end

  def down
  end
end
