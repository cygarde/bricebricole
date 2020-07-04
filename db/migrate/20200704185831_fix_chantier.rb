class FixChantier < ActiveRecord::Migration[6.0]
  def change
    rename_column :chantiers, :address, :adresse
  end
end
