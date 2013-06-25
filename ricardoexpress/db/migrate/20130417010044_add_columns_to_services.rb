class AddColumnsToServices < ActiveRecord::Migration
  def change
    add_column :services, :resumo, :text
    add_column :services, :imagem, :string
  end
end
