class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.int :zip
      t.string :phone
      t.string :street
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
