class AddColumnToPlace < ActiveRecord::Migration[5.0]
  def change
    add_column :places, :description, :string
  end
end
