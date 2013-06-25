class CreateServicetypes < ActiveRecord::Migration
  def change
    create_table :servicetypes do |t|
      t.string :name
      t.decimal :prince

      t.timestamps
    end
  end
end
