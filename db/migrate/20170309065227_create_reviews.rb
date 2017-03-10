class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
    	t.belongs_to :place
    	t.belongs_to :user
    	t.integer    :rate_general
    	t.string     :desc_general
    	t.integer    :rate_safe
    	t.string     :desc_safe
    	t.integer    :rate_clean
    	t.string     :desc_clean
    	t.integer    :rate_scenery
    	t.string     :desc_scenery

      t.timestamps
    end
  end
end
