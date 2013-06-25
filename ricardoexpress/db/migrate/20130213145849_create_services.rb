class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :slug
      t.string :name
      t.string :title
      t.text :description
      t.integer :servicetype_id
      t.integer :circuit_id

      t.timestamps
    end
  end
end
