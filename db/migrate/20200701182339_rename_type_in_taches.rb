class RenameTypeInTaches < ActiveRecord::Migration[6.0]
  def change
    remove_column :taches, :type, :string
  end
end
