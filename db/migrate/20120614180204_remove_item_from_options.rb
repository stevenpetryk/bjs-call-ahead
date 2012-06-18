class RemoveItemFromOptions < ActiveRecord::Migration
  def up
    remove_column :options, :item_id
  end

  def down
    add_column :options, :item, :references
  end
end
