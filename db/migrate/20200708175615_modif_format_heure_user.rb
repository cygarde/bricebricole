class ModifFormatHeureUser < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :heure_debut_travail, :string
    remove_column :users, :heure_fin_travail, :string
    add_column :users, :heure_debut_travail, :time
    add_column :users, :heure_fin_travail, :time
  end
end
