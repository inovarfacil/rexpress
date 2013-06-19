class CreateCircuits < ActiveRecord::Migration
  def change
    create_table :circuits do |t|
      t.string :origin_city
      t.string :destination_city

      t.timestamps
    end
  end
end
