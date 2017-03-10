class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|
      t.string :name
      t.string :type
      t.string :address
      t.string :city
      t.string :country
      t.integer :difficulty

      t.timestamps
    end
  end
end
