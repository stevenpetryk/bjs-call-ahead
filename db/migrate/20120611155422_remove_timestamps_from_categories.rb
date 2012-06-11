class RemoveTimestampsFromCategories < ActiveRecord::Migration
  def up
  	remove_column :categories, :created_at
  	remove_column :categories, :updated_at
  end

  def down
  end
end
