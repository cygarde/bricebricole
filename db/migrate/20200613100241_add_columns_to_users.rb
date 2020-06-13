class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :nom, :string
    add_column :users, :prenom, :string
    add_column :users, :nom_societe, :string
    add_column :users, :numero_siret, :integer
    add_column :users, :numero_tva, :integer
    add_column :users, :adresse, :string
    add_column :users, :jours_travail, :string
    add_column :users, :heure_debut_travail, :string
    add_column :users, :heure_fin_travail, :string
  end
end
