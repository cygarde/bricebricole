class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.string :nom
      t.string :prenom
      t.integer :telephone_1
      t.integer :telephone_2
      t.string :email
      t.string :adresse
      t.string :categorie
      t.text :information
      t.string :fidelite
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
