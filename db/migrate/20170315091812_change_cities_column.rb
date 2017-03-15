class ChangeCitiesColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :cities, :photo, :json
    remove_column :cities, :image
    end
end
