class AddColumnEntrepriseToClients < ActiveRecord::Migration[6.0]
  def change
    add_column :clients, :entreprise, :string
  end
end
