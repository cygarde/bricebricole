class ChangeColumnAdresse < ActiveRecord::Migration[6.0]
  def change
    rename_column :chantiers, :adresse, :address
  end
end
