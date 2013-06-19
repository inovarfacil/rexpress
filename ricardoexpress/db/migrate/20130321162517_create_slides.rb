class CreateSlides < ActiveRecord::Migration
  def change
    create_table :slides do |t|
      t.string :name
      t.string :image
      t.string :background
      t.text :text

      t.timestamps
    end
  end
end
