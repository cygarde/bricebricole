class ChangeDateInTaches < ActiveRecord::Migration[6.0]
  def change
    remove_column :taches, :date_debut
    remove_column :taches, :date_fin
    remove_column :taches, :heure_debut
    remove_column :taches, :heure_fin
    add_column :taches, :date_debut, :datetime
    add_column :taches, :date_fin, :datetime
  end
end
