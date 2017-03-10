    class AddColumnImageToPlace < ActiveRecord::Migration[5.0]
      def change
        add_column :places, :image, :json
      end
    end
