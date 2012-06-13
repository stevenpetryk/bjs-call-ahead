class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.integer :zip
      t.string :phone
      t.string :street
      t.string :city
      t.string :state
    end
  end
end
