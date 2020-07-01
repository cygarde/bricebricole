class AddCategorieToTaches < ActiveRecord::Migration[6.0]
  def change
    add_column :taches, :categorie, :string
  end
end
