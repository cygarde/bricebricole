class RenameTypeInTaches < ActiveRecord::Migration[6.0]
  def change
    remove_column :taches, :type, :string
    add_column :taches, :categorie, :string
  end
end
