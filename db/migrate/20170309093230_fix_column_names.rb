class FixColumnNames < ActiveRecord::Migration[5.0]
  def change
  	change_table :users do |t|
  		t.rename :image, :profile
  end
end 
end

