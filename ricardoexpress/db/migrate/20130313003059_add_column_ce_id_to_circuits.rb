class AddColumnCeIdToCircuits < ActiveRecord::Migration
  def change
    add_column :circuits, :ce_id, :integer  	
  end
end
