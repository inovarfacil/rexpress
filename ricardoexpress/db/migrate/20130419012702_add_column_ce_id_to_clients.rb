class AddColumnCeIdToClients < ActiveRecord::Migration
  def change
    add_column :clients, :ce_id, :integer
  end
end
