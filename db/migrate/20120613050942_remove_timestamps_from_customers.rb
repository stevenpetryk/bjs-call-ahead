class RemoveTimestampsFromCustomers < ActiveRecord::Migration
  def up
  	remove_column :customers, :created_at
  	remove_column :customers, :updated_at
  end

  def down
  end
end
