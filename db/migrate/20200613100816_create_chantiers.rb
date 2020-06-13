class CreateChantiers < ActiveRecord::Migration[6.0]
  def change
    create_table :chantiers do |t|
      t.string :reference
      t.string :nom
      t.string :description
      t.string :statut
      t.integer :priorite
      t.date :date_debut
      t.date :date_fin_estimee
      t.date :date_fin
      t.string :adresse
      t.integer :montant_versement
      t.integer :avancement
      t.references :client, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
