class AddColumnCircuitNameToServices < ActiveRecord::Migration
  def change
  	add_column :services, :circuit_name, :string
  end
end
