class CreateOptions < ActiveRecord::Migration
  def up
  	create_table :options do |t|
	    t.string :name
	    t.string :shortname
	    t.string :option_type
	    t.integer :parent_id
	    t.references :item
	  end
  end

  def down
  end
end
