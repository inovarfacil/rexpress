class CreateAbouts < ActiveRecord::Migration
  def change
    create_table :abouts do |t|
      t.string :slug
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
