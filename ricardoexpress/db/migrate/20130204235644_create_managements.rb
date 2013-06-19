class CreateManagements < ActiveRecord::Migration
  def change
    create_table :managements do |t|
      t.string :site_name
      t.string :tagline
      t.text :description
      t.string :keywords
      t.string :icon
      t.string :logo
      t.string :facebook
      t.string :twitter
      t.string :linkedin
      t.string :youtube

      t.timestamps
    end
  end
end
