class RemoveStarsFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :stars, :string
  end
end
