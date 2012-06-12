class RemoveTimestampsFromFavorites < ActiveRecord::Migration
  def up
  	remove_column :favorites, :created_at
  	remove_column :favorites, :updated_at
  end

  def down
  end
end
