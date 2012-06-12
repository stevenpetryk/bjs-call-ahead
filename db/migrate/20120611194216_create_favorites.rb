class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.references :customer
      t.references :item

      t.timestamps
    end
    add_index :favorites, :customer_id
    add_index :favorites, :item_id
  end
end
