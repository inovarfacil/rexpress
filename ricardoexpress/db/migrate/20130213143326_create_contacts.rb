class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :slug
      t.string :title
      t.string :name
      t.string :phone
      t.string :email
      t.string :subject
      t.text :message

      t.timestamps
    end
  end
end
