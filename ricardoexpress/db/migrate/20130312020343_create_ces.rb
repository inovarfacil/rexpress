class CreateCes < ActiveRecord::Migration
  def change
    create_table :ces do |t|
      t.string :city
      t.string :uf

      t.timestamps
    end
  end
end
