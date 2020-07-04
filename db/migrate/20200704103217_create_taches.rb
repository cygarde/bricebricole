class CreateTaches < ActiveRecord::Migration[6.0]
  def change
    create_table :taches do |t|
      t.string :objet
      t.text :description
      t.text :note
      t.string :type
      t.integer :priorite
      t.string :environnement
      t.date :date_debut
      t.date :date_fin
      t.time :heure_debut
      t.time :heure_fin
      t.datetime :jalon_anomalie
      t.boolean :dependance
      t.boolean :equipement
      t.text :equipement_description
      t.boolean :realisation
      t.references :chantier, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
