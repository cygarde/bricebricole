# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_06_15_201809) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chantiers", force: :cascade do |t|
    t.string "reference"
    t.string "nom"
    t.string "description"
    t.string "statut"
    t.integer "priorite"
    t.date "date_debut"
    t.date "date_fin_estimee"
    t.date "date_fin"
    t.string "adresse"
    t.integer "montant_versement"
    t.integer "avancement"
    t.bigint "client_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_chantiers_on_client_id"
    t.index ["user_id"], name: "index_chantiers_on_user_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "nom"
    t.string "prenom"
    t.integer "telephone_1"
    t.integer "telephone_2"
    t.string "email"
    t.string "adresse"
    t.string "categorie"
    t.text "information"
    t.string "fidelite"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "entreprise"
    t.index ["user_id"], name: "index_clients_on_user_id"
  end

  create_table "taches", force: :cascade do |t|
    t.string "objet"
    t.text "description"
    t.text "note"
    t.string "type"
    t.integer "priorite"
    t.string "environnement"
    t.date "date_debut"
    t.date "date_fin"
    t.time "heure_debut"
    t.time "heure_fin"
    t.datetime "jalon_anomalie"
    t.boolean "dependance"
    t.boolean "equipement"
    t.text "equipement_description"
    t.boolean "realisation"
    t.bigint "chantier_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chantier_id"], name: "index_taches_on_chantier_id"
    t.index ["user_id"], name: "index_taches_on_user_id"
  end

  create_table "taggings", id: :serial, force: :cascade do |t|
    t.integer "tag_id"
    t.string "taggable_type"
    t.integer "taggable_id"
    t.string "tagger_type"
    t.integer "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "taggings_taggable_context_idx"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
  end

  create_table "tags", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "nom"
    t.string "prenom"
    t.string "nom_societe"
    t.integer "numero_siret"
    t.integer "numero_tva"
    t.string "adresse"
    t.string "jours_travail"
    t.string "heure_debut_travail"
    t.string "heure_fin_travail"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "chantiers", "clients"
  add_foreign_key "chantiers", "users"
  add_foreign_key "clients", "users"
  add_foreign_key "taches", "chantiers"
  add_foreign_key "taches", "users"
  add_foreign_key "taggings", "tags"
end
