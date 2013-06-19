class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :phone
      t.string :cellphone
      t.string :address
      t.string :email
      t.string :city
      t.text :observations

      t.timestamps
    end
  end
end
